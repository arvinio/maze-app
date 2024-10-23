import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_add_photo.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_view_photo.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/compost_use.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/domain/entity/what_did_add.dart';
import 'package:maze_app/feature/tracker/presentation/view/entry_page/presentation/bloc/entry_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/entry_page/presentation/widgets/custom_container_list.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/compost_use_sheet.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custom_item.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/get_entry_type_icon.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/loading.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/what_did_add_selection_sheet.dart';

@RoutePage()
class EntryPage extends StatefulWidget implements AutoRouteWrapper {
  const EntryPage({super.key, required this.bin});
  final Bin bin;

  @override
  State<EntryPage> createState() => _EntryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<EntryBloc>(), child: this);
  }
}

class _EntryPageState extends State<EntryPage> {
  late Entry _entry;

  late List<DateTime?> _dialogCalendarPickerValue;

  final _dateController = TextEditingController(text: 'Select date');
  final _noteController = TextEditingController();
  final _amountController = TextEditingController();
  var _radioAmount = 100;
  var _entryType = EntryType.generalNote;
  List<File?> photos = [];
  final List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  String? _birthDate;
  List<WhatDidAddItem> _selectedItems = [];
  List<CompostUseItem> _selectedCompostUseItems = [];
  bool _didYouMixit = false;
  String _selectedFullness = appStrings.aFullBinSize;

  void fillEntry() {
    switch (_entryType) {
      case EntryType.emptiedBin:
        _entry = Entry(
          binId: widget.bin.id!,
          type: _entryType,
          entryDate: _dialogCalendarPickerValue != null
              ? _dialogCalendarPickerValue[0]!
              : DateTime.now(),
          note: _noteController.text,
          photo: photos.map(
                (e) {
              return e!.path;
            },
          ).toList(),
          howFull:_selectedFullness,
          amount:  _amountController.text,

          whatDidAdd:[],
          compostUsed: [],
          mixed: _didYouMixit,

        );
        break;
      case EntryType.emptiedCompost:
        _entry = Entry(
          binId: widget.bin.id!,
          type: _entryType,
          entryDate: _dialogCalendarPickerValue != null
              ? _dialogCalendarPickerValue[0]!
              : DateTime.now(),
          note: _noteController.text,
          photo: photos.map(
                (e) {
              return e!.path;
            },
          ).toList(),
          compostUsed: _selectedCompostUseItems.isNotEmpty ?
              _selectedCompostUseItems.map((e)=>e.name).toList()
              :[],
          howFull:'$_radioAmount%',
          amount: _amountController.text,
          mixed: _didYouMixit,
          whatDidAdd: [],

        );
        break;
      case EntryType.addedWaste:
        _entry = Entry(
            binId: widget.bin.id!,
            type: _entryType,
            entryDate: _dialogCalendarPickerValue != null
                ? _dialogCalendarPickerValue[0]!
                : DateTime.now(),
            note: _noteController.text,
            photo: photos.map(
                  (e) {
                return e!.path;
              },
            ).toList(),
            whatDidAdd: [],
            mixed: _didYouMixit,
            compostUsed: _selectedItems.isNotEmpty ?
            _selectedItems.map((e)=>e.name).toList()
                :[],
            howFull:null,
            amount:null
        );
        break;


      default:
        _entry = Entry(
          binId: widget.bin.id!,
          type: _entryType,
          entryDate: _dialogCalendarPickerValue != null
              ? _dialogCalendarPickerValue[0]!
              : DateTime.now(),
          note: _noteController.text,
          photo: photos.map(
                (e) {
              return e!.path;
            },
          ).toList(),
          whatDidAdd: [],
          compostUsed: [],
          mixed: _didYouMixit,
          howFull: null,
          amount: null,

        );
    }
  }

  @override
  void initState() {
    _dialogCalendarPickerValue = [DateTime.now()];
    _amountController.text =
        ((_radioAmount / 100) * widget.bin.amountOfLiters!).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EntryBloc, EntryState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.maybePop();
        } else if (state.status.isFailure) {
          Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return BasePageWidget(
          appBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PreviousButton(padding: EdgeInsets.all(8),),
                SizedBox(width: 88.w,),
                CustomText('${DateTime
                    .now()
                    .day} ${monthList[DateTime
                    .now()
                    .month - 1]} ${DateTime
                    .now()
                    .year}', style: context.titleHeadline),
                SizedBox(width: 55.w,),
                state.status.isLoading
                    ? const Loading()
                    : TextButton(
                  onPressed: (() {
                    fillEntry();
                    context.read<EntryBloc>().add(
                        EntryEvent.addEntryToBin(entryDetails: _entry));
                  }),
                  child: CustomText(
                    appStrings.save,
                    style: context.titleHeadline.copyWith(
                      color: context
                          .scheme()
                          .primary,
                    ),
                  ),
                )
              ],),
          ),
          child: BasePageWidget(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrackerField(
                    title: widget.bin.nickName,
                    titleStyle: context.titleHeadline,
                    subTitle: '${widget.bin.amountOfLiters ?? 0 } ${appStrings
                        .litres}',
                    subTitleStyle: context.captionCaption.copyWith(
                        color: context
                            .scheme()
                            .secondaryText),
                    onTap: null,
                    leadingIcon: widget.bin.imageUrl == null
                        ? const NoImage()
                        : SizedBox(
                      height: 80.dg,
                      width: 80.dg,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15.sp)),
                          child: Image.network(widget.bin.imageUrl!,
                            fit: BoxFit.cover,)),
                    ),
                    // containerPadding: EdgeInsets.zero,
                    trailing: const SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomText(
                    appStrings.date,
                    style: context.titleHeadline,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildSelectDate(context),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomText(
                    appStrings.entry,
                    style: context.titleHeadline,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomContainerList(
                      height: _getEntrySelectionHeight,
                      children: [
                        CustomItem(
                          title: _entryType.displayText,
                          height: 60.h,
                          func: () {
                            openModalBottomSheet(
                                context, entrySelection(context).$1,
                                height: entrySelection(context).$2);
                          },
                          trailing: appAssets.dropDown.svg(),
                          leading: GetEntryTypeIcon(entryType: _entryType),
                        ),
                        ...showEntryRelatedWidgets()
                      ]),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (_entryType == EntryType.emptiedCompost ||
                      _entryType == EntryType.emptiedBin) ...[
                    CustomText(
                      _entryType==EntryType.emptiedBin
                      ? appStrings.howFullPickedUp
                      :appStrings.howFullCompost,
                      style: context.titleHeadline,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _entryType==EntryType.emptiedBin
                   ? CustomContainerList(
                        children: [
                          _buildFullnessOption(appStrings.aFullBinSize, '100%'),
                          _buildFullnessOption(appStrings.aHalfOfTheBinSize, '50%'),
                          _buildFullnessOption(appStrings.aQuarterOfTheBinSize, '25%'),
                        ],
                      )
                    :  _entryType==EntryType.emptiedCompost
                   ? CustomContainerList(children: [
                      amountPercentage(100),
                      amountPercentage(75),
                      amountPercentage(50),
                      amountPercentage(25),
                    ])
                    :const Center(),

                    SizedBox(
                      height: 15.h,
                    ),
                    CustomText(
                      _entryType==EntryType.emptiedBin
                      ? appStrings.amountOfWaste
                        :appStrings.amountOfCompost,
                        style: context.titleHeadline
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextField.outline(
                        textEditingController: _amountController,
                        label: appStrings.estimatedWeight,
                        labelTextColor: context
                            .scheme()
                            .secondaryText,
                        suffixIcon: IconButton(iconSize: 20,
                          padding: EdgeInsets.zero,
                          highlightColor: Colors.transparent,
                          constraints: const BoxConstraints(
                              maxHeight: 24, maxWidth: 24),
                          icon: appAssets.infoSize.svg(),
                          onPressed: () {
                            ShowDialog.sizeInfo(context);
                          },)
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                  CustomText(
                    appStrings.note,
                    style: context.titleHeadline,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField.outline(
                    textEditingController: _noteController,
                    hint: appStrings.noteDesc,
                    maxLines: 5,
                    padding: const EdgeInsets.all(16),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomText(
                    appStrings.photos,
                    style: context.titleHeadline,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  photosSection(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  InkWell buildSelectDate(BuildContext context) {
    return InkWell(
              onTap: () {
                _selectDate(context, (date) {
                  _dialogCalendarPickerValue = date!;
                  setState(() {
                    _dateController.text =
                    /* DateFormat('dd MMM yyyy').format(date[0]!).toString();*/
                    '${date![0]!.day} ${monthList[date![0]!.month -
                        1]} ${date![0]!.year}';
                    _birthDate =
                    '${date![0]!.year}/${date![0]!.month}/${date![0]!
                        .day}';

                  });

                });
              },
              child: Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: context
                      .scheme()
                      .neutralsBorderDivider),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _dateController.text,
                      style: context.subheadlineSubheadline.copyWith(
                        color: context
                            .scheme()
                            .primaryText,
                      ),
                    ),
                    SizedBox(
                      child: appAssets.calendarIcon.svg(),
                    )
                  ],
                ),
              ),
            );
  }

  Row photosSection(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    SizedBox(
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
          icon: const CustomAddPhoto(),
        ),
        SizedBox(
          width: 10.w,
        ),
        if (photos.isNotEmpty)
          SizedBox(
            height: 100.h,
            width: 200.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return CustomViewPhoto(
                    child: Image.file(
                      photos[index]!,
                    ),
                    onPressed: () =>
                        setState(() {
                          photos.removeAt(index);
                        }));
              },
            ),
          ),
      ],
    );
  }

  CustomItem amountPercentage(int amount) {
    return CustomItem(
      height: 50.h,
      title: '$amount%',
      titleStyle: context.bodyBodyMedium,
      trailing: Radio(
        value: amount,
        groupValue: _radioAmount,
          activeColor:context.scheme().primary,
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

  Widget _buildFullnessOption(String label, String percentage) {
    return CustomItem(
      height: 50.h,
      title: label,
      titleStyle: context.bodyBodyMedium,
      trailing: Radio<String>(
        value: label,
        groupValue: _selectedFullness,
        activeColor: context.scheme().primary,
        onChanged: (value) {
          setState(() {
            _selectedFullness = value!;
            _radioAmount = int.parse(percentage.replaceAll('%', ''));
            _amountController.text = ((_radioAmount / 100) * widget.bin.amountOfLiters!).toString();
          });
        },
      ),
    );
  }

  List<Widget> showEntryRelatedWidgets() {
    if (widget.bin.type == BinType.compost) {
      switch (_entryType) {
        case EntryType.emptiedCompost:
          return [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomItem(
                  title: appStrings.compostUse,
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
                      setState(() {
                        _selectedCompostUseItems = result;
                      });
                    }
                  },
                  trailing:appAssets.dropDown.svg(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0,bottom: 16),
                  child: CustomText(_selectedCompostUseItems.isNotEmpty?_selectedCompostUseItems.map((e)=>e.name).toString():""
                  ),
                )
              ],
            ),
          ];
        case EntryType.addedWaste:
          return [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomItem(
                  title: appStrings.whatDidYouAdd,
                  height: 50.h,
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
                  padding: const EdgeInsets.only(left:16.0,bottom: 16),
                  child: CustomText(_selectedItems.isNotEmpty?_selectedItems.map((e)=>e.name).toString():""
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.dg),
              child: ListTile(
                  title: CustomText(appStrings.didYouMixIt),
                  subtitle: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.dg),
                    child: CustomText(_didYouMixit ? appStrings.yes : appStrings.no),
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
            CustomItem(
              title: EntryType.addedWaste.displayText,
              titleStyle: context.bodyBody,
              height: 65.h,
              func: () {
                setState(() {
                  _entryType = EntryType.addedWaste;
                });
                context.maybePop();
              },
              leading: appAssets.addWasteIcon.svg(),
            ),
            CustomItem(
              title: EntryType.emptiedCompost.displayText,
              titleStyle: context.bodyBody,
              height: 65.h,
              func: () {
                setState(() {
                  _entryType = EntryType.emptiedCompost;
                });
                context.maybePop();
              },
              leading: appAssets.emptiedCompostIcon.svg(),
            ),
            CustomItem(
              title: EntryType.generalNote.displayText,
              titleStyle: context.bodyBody,
              height: 65.h,
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
        308.h
      );
    }
    return (
      CustomContainerList(
        height: 140.h,
        children: [
          CustomItem(
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
          CustomItem(
            title: EntryType.generalNote.toString().replaceFirst('-', ' '),
            height: 90.h,
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
                    const ExitButton(padding: EdgeInsets.only(top: 13),),
                    CustomText(appStrings.entryType,style: context.titleHeadline,),
                    SizedBox(
                      width: 70.w,
                    ),
                  ]
                ],
              ),
              SizedBox(height: 10.h,),
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
      if (_entryType == EntryType.addedWaste) return 250.h;
      if (_entryType == EntryType.emptiedCompost) return 150.h;
    }

    return 60.h;
  }
}
