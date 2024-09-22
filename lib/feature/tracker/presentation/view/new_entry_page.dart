import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/compost_use.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/domain/entity/what_did_add.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/compost_use_sheet.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custom_container_list.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custome_items.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/feed_filter_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/get_entry_type_icon.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/what_did_add_selection_sheet.dart';

@RoutePage()
class NewEntryPage extends StatefulWidget implements AutoRouteWrapper {
  const NewEntryPage({super.key, required this.bin});
  // const NewEntryPage.edit({super.key, required this.bin});
  final Bin bin;

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<TrackerBloc>(), child: this);
  }
}

class _NewEntryPageState extends State<NewEntryPage> {
  late Entry _entry;

  late List<DateTime?> _dialogCalendarPickerValue;

  final _dateController = TextEditingController(text: 'Select date');
  final _noteController = TextEditingController();
  final _amountController = TextEditingController();
  var _radioAmount = 100;
  var _entryType = EntryType.generalNote;
  List<File?> photos = [];

  void fillEntry() {
    _entry = Entry(
      whatRecycled: [],
      whatDidAdd: [],
      compostUsed: [],
      entryDate: _dialogCalendarPickerValue[0]!,
      binId: widget.bin.id!,
      type: _entryType,
      mixed: false,
      note: _noteController.text,
      photo: photos.map(
        (e) {
          return e!.path;
        },
      ).toList(),
      howFull: _radioAmount.toString(),
      amount: _amountController.text,
    );
  }

  @override
  void initState() {
    _dialogCalendarPickerValue = [DateTime.now()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        title: const Text('entry'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: (() {
              fillEntry();
              context.read<TrackerBloc>().add(TrackerEvent.addEntryToBin(
                  binId: widget.bin.id!, entryDetails: _entry));
              context.maybePop();
            }),
            child: CustomText(
              'Save',
              style: context.titleHeadline.copyWith(
                color: context.scheme().primary,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrackerField(
              title: widget.bin.nickName,
              onTap: null,
              leadingIcon: widget.bin.imageUrl == null
                  ? null
                  : SizedBox(
                      width: 40.dg,
                      height: 40.dg,
                      child: Image.network(widget.bin.imageUrl!),
                    ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              "Date",
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                _selectDate(context, (date) {
                  _dialogCalendarPickerValue = date!;
                  setState(() {
                    _dateController.text =
                        DateFormat('dd MMM yyyy').format(date[0]!).toString();
                  });

                  // '${date![0]!.day} ${monthList[date![0]!.month -
                  //     1]} ${date![0]!.year}';
                });
              },
              child: Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: context.scheme().neutralsBorderDivider),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _dateController.text,
                      style: context.subheadlineSubheadline.copyWith(
                        color: context.scheme().primaryText,
                      ),
                    ),
                    SizedBox(
                      child: appAssets.calendarIcon.svg(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              "Entry",
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomContainerList(height: _getEntrySelectionHeight, children: [
              CustomeItem(
                title: _entryType.displayText,
                height: 60.h,
                func: () {
                  openModalBottomSheet(context, entrySelection(context).$1,
                      height: entrySelection(context).$2);
                },
                trailing: Icon(Icons.arrow_drop_down_rounded),
                leading: GetEntryTypeIcon(entryType: _entryType),
              ),
              ...showEntryRelatedWidgets()
            ]),
            // if (_entryType == EntryType.emptiedCompost ||
            //     _entryType == EntryType.emptiedBin)
            SizedBox(
              height: 15.h,
            ),
            if (_entryType == EntryType.emptiedCompost ||
                _entryType == EntryType.emptiedBin) ...[
              CustomText(
                "How full was the bin before the council picked it up?",
                style: context.titleHeadline,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomContainerList(children: [
                amountPercentage(100),
                amountPercentage(75),
                amountPercentage(50),
                amountPercentage(25),
              ]),
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                "Amount of compost emptied",
                style: context.titleHeadline,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField.outline(
                textEditingController: _amountController,
                label: "Amount of litres",
                labelTextColor: context.scheme().secondaryText,
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
            CustomText(
              "Note",
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField.outline(
              textEditingController: _noteController,
              maxLines: 5,
            ),
            SizedBox(
              height: 15.h,
            ),

            CustomText(
              "Photos",
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 15.h,
            ),
            photosSection(context),
          ],
        ),
      ),
    );
  }

  Row photosSection(BuildContext context) {
    return Row(
      children: [
        if (photos.length < 3)
          Container(
            height: 90.dg,
            width: 90.dg,
            decoration: BoxDecoration(
              color: context.scheme().neutralsBackground,
              border: Border.all(color: context.scheme().neutralsBorderDivider),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
            ),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: IconButton.filled(
                  onPressed: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              height: 150.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 70.h,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: IconButton(
                                        onPressed: () async {
                                          XFile? result = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          if (result != null) {
                                            setState(() {
                                              photos.add(File(result.path));
                                              Navigator.pop(context);
                                            });
                                          }
                                        },
                                        icon: const Icon(Icons.camera_alt),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      XFile? result = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery);
                                      if (result != null) {
                                        setState(() {
                                          photos.add(File(result.path));
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.photo),
                                  ),
                                ],
                              ),
                            ));
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ),
        SizedBox(
          width: 10.w,
        ),
        if (photos.isNotEmpty)
          SizedBox(
            height: 100.h,
            width: photos.length == 3 ? 300.w : 200.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.scheme().neutralsBackground,
                      border: Border.all(
                          color: context.scheme().neutralsBorderDivider),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimen.defaultRadius)),
                    ),
                    height: 90.h,
                    width: 90.h,
                    margin: EdgeInsets.only(right: 15.w),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimen.defaultRadius)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.file(
                          photos[index]!,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () => setState(() {
                        photos.removeAt(index);
                      }),
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]);
              },
            ),
          ),
      ],
    );
  }

  CustomeItem amountPercentage(int amount) {
    return CustomeItem(
      height: 50.h,
      title: '$amount%',
      trailing: Radio(
        value: amount,
        groupValue: _radioAmount,
        onChanged: (value) {
          setState(() {
            _radioAmount = value!;
            _amountController.text =
                ((value / 100) * widget.bin.amountOfLiters!).toString();
          });
        },
      ),
    );
  }

// Example function to open the CompostSelectionSheet and handle the result

// Define _selectedItems to store the result
  List<WhatDidAddItem> _selectedItems = [];
  List<CompostUseItem> _selectedCompostUseItems = [];
  bool _didYouMixit = false;

  List<Widget> showEntryRelatedWidgets() {
    if (widget.bin.type == BinType.compost) {
      switch (_entryType) {
        case EntryType.emptiedCompost:
          return [
            CustomeItem(
              title: 'Compost use',
              height: 60.h,
              func: () async {
                final List<CompostUseItem>? result = await openModalBottomSheet(
                    context,
                    CompostUseSheet(
                      selectedItems: _selectedCompostUseItems,
                    ),
                    height: 500.h,
                    hasHeader: false);
                if (result != null) {
                  // Handle the selected items
                  setState(() {
                    _selectedCompostUseItems = result;
                  });
                }
              },
              trailing: const Icon(Icons.arrow_drop_down_rounded),
            ),
          ];
        case EntryType.addedWaste:
          return [
            CustomeItem(
              title: 'What did you add?',
              height: 60.h,
              func: () async {
                final List<WhatDidAddItem>? result = await openModalBottomSheet(
                    context,
                    WhatDidYouAddSheet(
                      selectedItems: _selectedItems,
                    ),
                    height: 650.h,
                    hasHeader: false);
                if (result != null) {
                  // Handle the selected items
                  setState(() {
                    _selectedItems = result;
                  });
                }
              },
              trailing: const Icon(Icons.arrow_drop_down_rounded),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.dg),
              child: ListTile(
                  title: CustomText('Did you mix it?'),
                  subtitle: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.dg),
                    child: CustomText(_didYouMixit ? 'Yes' : 'No'),
                  ),
                  trailing: Switch.adaptive(
                    value: _didYouMixit,
                    onChanged: (value) {
                      setState(() {
                        _didYouMixit = value;
                      });
                    },
                  )),
            )
          ];
        case EntryType.emptiedBin:
        case EntryType.generalNote:
        default:
          return [];
      }
    } else {
      return [];
    }
  }

  (CustomContainerList, double) entrySelection(BuildContext context) {
    if (widget.bin.type == BinType.compost) {
      return (
        CustomContainerList(
          height: 200.h,
          children: [
            CustomeItem(
              title: EntryType.addedWaste.toString().replaceFirst('-', ' '),
              height: 60.h,
              func: () {
                setState(() {
                  _entryType = EntryType.addedWaste;
                });
                context.maybePop();
              },
              leading: appAssets.addWasteIcon.svg(),
            ),
            CustomeItem(
              title: EntryType.emptiedCompost.toString().replaceFirst('-', ' '),
              height: 60.h,
              func: () {
                setState(() {
                  _entryType = EntryType.emptiedCompost;
                });
                context.maybePop();
              },
              leading: appAssets.emptiedCompostIcon.svg(),
            ),
            CustomeItem(
              title: EntryType.generalNote.toString().replaceFirst('-', ' '),
              height: 60.h,
              func: () {
                setState(() {
                  _entryType = EntryType.generalNote;
                });
                context.maybePop();
              },
              leading: appAssets.generalNoteIcon.svg(),
            ),
          ],
        ),
        300.h
      );
    }
    return (
      CustomContainerList(
        height: 140.h,
        children: [
          CustomeItem(
            title: EntryType.emptiedBin.toString().replaceFirst('-', ' '),
            height: 60.h,
            func: () {
              setState(() {
                _entryType = EntryType.emptiedBin;
              });
              context.maybePop();
            },
            leading: appAssets.addWasteIcon.svg(),
          ),
          CustomeItem(
            title: EntryType.generalNote.toString().replaceFirst('-', ' '),
            height: 60.h,
            func: () {
              setState(() {
                _entryType = EntryType.generalNote;
              });
              context.maybePop();
            },
            leading: appAssets.generalNoteIcon.svg(),
          ),
        ],
      ),
      250.h
    );
  }

  Future<dynamic> openModalBottomSheet(
    BuildContext context,
    Widget child, {
    double? height,
    bool hasHeader = true,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context.scheme().neutralsBackground,
      context: context,
      builder: (context) {
        return Container(
          height: height ?? 300.h,
          padding: EdgeInsets.only(
              right: Dimen.pagePaddingHorizontal,
              left: Dimen.pagePaddingHorizontal,
              bottom: 40.h,
              top: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (hasHeader) ...[
                    const ExitButton(),
                    CustomText('Entry type'),
                    SizedBox(
                      width: 70.w,
                    ),
                  ]
                ],
              ),
              child,
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context,
      Function(List<DateTime?>? date) onSelectDate) async {
    final date = (await showCalendarDatePicker2Dialog(
        context: context,
        config: config,
        dialogSize: const Size(325, 370),
        borderRadius: BorderRadius.circular(15),
        value: _dialogCalendarPickerValue,
        dialogBackgroundColor: Colors.white));

    if (date != null) onSelectDate(date);
  }

  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
    calendarType: CalendarDatePicker2Type.single,
    selectedDayHighlightColor: const Color(0xff5AA700),
    closeDialogOnCancelTapped: true,
    firstDayOfWeek: 1,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    centerAlignModePicker: true,
    customModePickerIcon: const SizedBox(),
  );

  double get _getEntrySelectionHeight {
    if (widget.bin.type == BinType.compost) {
      if (_entryType == EntryType.addedWaste) return 200.h;
      if (_entryType == EntryType.emptiedCompost) return 150.h;
    }

    return 60.h;
  }
}
