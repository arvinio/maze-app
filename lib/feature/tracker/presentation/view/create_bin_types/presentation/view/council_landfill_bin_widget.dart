import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_add_photo.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_view_photo.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/enum/create_bin_types.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/create_bin_types/presentation/bloc/create_bins_type_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/create_bin_types/presentation/widgets/custom_cupertino_picker.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/help_header.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tab_content_view.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';


class CouncilLandfillBinWidget extends StatefulWidget  implements AutoRouteWrapper{
  const CouncilLandfillBinWidget({
    super.key,
  });

  @override
  State<CouncilLandfillBinWidget> createState() =>
      _CouncilLandfillBinWidgetState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<CreateBinsTypeBloc>(), child: this);

  }
}

class _CouncilLandfillBinWidgetState extends State<CouncilLandfillBinWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController pickupDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();

  final focusNodeNickName = FocusNode();
  final focusNodePickUpDate = FocusNode();
  final focusNodeAmount = FocusNode();

  final widthFocusNode = FocusNode();
  final heightFocusNode = FocusNode();
  final lengthFocusNode = FocusNode();


  late final TabController tabController;

  SizeType sizeType = SizeType.litres;

  File? file;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(
          () {
        setState(() {
          if (tabController.index == 0) {
            sizeType = SizeType.litres;
            return;
          }
          sizeType = SizeType.dimensions;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateBinsTypeBloc, CreateBinsTypeState>(
      listener: (context, state) async {
        if (state.status.isSuccess) {
          Navigator.of(context).popUntil((route) => route.isFirst);
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
        return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelpHeader(leadingIcon: PreviousButton()),
            CustomText(
              appStrings.councilLandfillBinTitle,
              style: context.titleTitle1,
            ),
            SizedBox(
              height: 15.h,
            ), CustomText(
              appStrings.councilLandfillBinSubTitle,
              style: context.bodyBody,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              appStrings.details,
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField.outline(
              textEditingController: nickNameController,
              label: appStrings.nickname,
              focusNode: focusNodeNickName,
              labelTextColor: context
                  .scheme()
                  .secondaryText,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField.outline(
              textEditingController: pickupDateController,
              label: appStrings.councilPickupDates,
              focusNode: focusNodePickUpDate,
              labelTextColor: context
                  .scheme()
                  .secondaryText,
              readOnly: true,
              suffixIcon: Padding(padding: const EdgeInsets.all(7),
                  child: appAssets.dropDown.svg(width: 10, height: 10)),
              onTap: () {
                _showPickupDateDialog(context);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  appStrings.size,
                  style: context.titleHeadline,
                ),
                IconButton(onPressed: () {
                  ShowDialog.sizeInfo(context);
                },
                    icon: appAssets.infoSize.svg())
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            TrackerTabBar(
              tabController: tabController,
              title1: appStrings.litres,
              title2: appStrings.dimensions,
            ),
            SizedBox(
              height: 20.h,
            ),
            TabContentView(
              controller: tabController,
              children: [
                CustomTextField.outline(
                  textEditingController: amountController,
                  label: appStrings.amountLitres,
                  focusNode: focusNodeAmount,
                  keyboardType: TextInputType.number,
                  labelTextColor: context
                      .scheme()
                      .secondaryText,
                ),
                SizedBox(
                  height: 210.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField.outline(
                        textEditingController: widthController,
                        label: appStrings.width,
                        focusNode: widthFocusNode,
                        keyboardType: TextInputType.number,
                        labelTextColor: context
                            .scheme()
                            .secondaryText,
                      ),
                      CustomTextField.outline(
                        textEditingController: heightController,
                        label: appStrings.height,
                        focusNode: heightFocusNode,
                        keyboardType: TextInputType.number,
                        labelTextColor: context
                            .scheme()
                            .secondaryText,
                      ),
                      CustomTextField.outline(
                        textEditingController: lengthController,
                        label: appStrings.length,
                        focusNode: lengthFocusNode,
                        keyboardType: TextInputType.number,
                        labelTextColor: context
                            .scheme()
                            .secondaryText,
                      ),
                    ],),
                )
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            CustomText(
              appStrings.photo,
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              SizedBox(
                                height: 150.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
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
                                                file = File(result.path);
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
                                            file = File(result.path);
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
                    icon: const CustomAddPhoto()
                ),
                SizedBox(
                  width: 10.w,
                ),
                if (file != null) ...[
                  CustomViewPhoto(child: Image.file(file!),
                      onPressed: () {
                        setState(() {
                          file = null;
                        });
                      })
                ]
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton.submit(
                text: appStrings.addBinTitle,
                showLoading: state.status.isLoading,
                onPressed: () {
                  context.read<CreateBinsTypeBloc>().add(
                      CreateBinsTypeEvent.createBin(
                      bin: Bin(
                        type: BinType.landfill,
                        id: null,
                        nickName: nickNameController.text,
                        sizeType: sizeType,
                        amountOfLiters: sizeType == SizeType.litres
                            ? amountController.text.isNotEmpty ? int.parse(
                            amountController.text) : null
                            : null,
                        isShare: false,
                        imageUrl: (file != null) ? file!.path : null,
                        width: sizeType == SizeType.dimensions ? widthController
                            .text.trim() : null,
                        length: sizeType == SizeType.dimensions
                            ? lengthController.text.trim()
                            : null,
                        height: sizeType == SizeType.dimensions
                            ? heightController.text.trim()
                            : null,
                        pickUpDate: pickupDateController.text,
                        typeOfCompostBin: null,
                        is2Compostement: null,
                        isCouncil:true

                      ),
                        binType: CreateBinTypes.councilLandfillBin

                    ),
                  );
                })
          ],
        ),
      ),
    );
  },
);
  }


  void _showPickupDateDialog(BuildContext context) {
    List<String> periods = [appStrings.everyWeek, appStrings.everySecond];
    List weekDays = [
      appStrings.monday,
      appStrings.tuesday,
      appStrings.wednesday,
      appStrings.thursday,
      appStrings.friday,
      appStrings.saturday,
      appStrings.sunday
    ];
    int weekSelected = 3;
    int periodsSelected = 0;
    ValueNotifier<bool> obscureState = ValueNotifier(false);

    ShowDialog.openModalBottomSheet(context,
      height: 400.h,
      child: ValueListenableBuilder(
          valueListenable: obscureState,
          builder: (BuildContext context, bool obscureValue,
              Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetHeader(
                  title: appStrings.councilPickupDates,
                  closeIcon: appAssets.close.svg(),
                  showDivider: false,
                ),
                SizedBox(
                  height: 300,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                              child: CustomCupertinoPicker(children: List<
                                  Widget>.generate(
                                  periods.length, (int index) {
                                return Center(child: CustomText(
                                  periods[index], style: context.bodyBody,));
                              }),
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(() {
                                    periodsSelected = selectedItem;
                                    obscureState.value = !obscureState.value;
                                  });
                                },
                              )),
                          Flexible(
                              child:
                              CustomCupertinoPicker(
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(() {
                                    weekSelected = selectedItem;
                                    obscureState.value = !obscureState.value;
                                  });
                                },
                                initialItem: 3, children: List<Widget>.generate(
                                  weekDays.length, (int index) {
                                return Center(
                                  child: CustomText(
                                      weekDays[index], style: context.bodyBody),
                                );
                              }),
                              ))
                        ]
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    ).then((value) {
      pickupDateController.text =
      '${periods[periodsSelected]}, ${weekDays[weekSelected]}';
    });
  }
}
