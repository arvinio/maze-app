import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_add_photo.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_view_photo.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/help_header.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tab_content_view.dart';

import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/two_compartment_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/type_of_compost_widget.dart';

class NewCompostBinWidget extends StatefulWidget {
  const NewCompostBinWidget({
    super.key,
    required this.bloc,
  });
  final TrackerBloc bloc;

  @override
  State<NewCompostBinWidget> createState() => _NewCompostBinWidgetState();
}

class _NewCompostBinWidgetState extends State<NewCompostBinWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController typeOfController =
      TextEditingController(text: 'Compost Tumbler');
  final TextEditingController twoCompartmentController =
      TextEditingController();
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

  final focusNodeTypeOf = FocusNode();
  final focusNodeTwoCompartment = FocusNode();

  late final TabController tabController;

  final sizeType = SizeType.litres;

  File? file;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(
      () {
        setState(() {
          if (tabController.index == 0) {
            sizeType == SizeType.litres;
            return;
          }
          sizeType == SizeType.dimensions;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HelpHeader(leadingIcon: PreviousButton()),
          Expanded(
            child: ListView(
              children: [
                CustomText(
                  appStrings.newCompostBinTitle,
                  style: context.titleTitle1,
                ),
                SizedBox(
                  height: 15.h,
                ),  CustomText(
                  appStrings.newCompostBinSubTitle,
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
                  height: 15.h,
                ),
                CustomTextField.outline(
                  textEditingController: typeOfController,
                  label: appStrings.councilBin,
                  focusNode: focusNodeTypeOf,
                  readOnly: true,
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(7),
                      child: appAssets.dropDown.svg(width: 10, height: 10)),
                  labelTextColor: context.scheme().secondaryText,
                  onTap: () {
                    _showCouncilBinDialog(context, (result) {
                      typeOfController.text = result;
                    });
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField.outline(
                  textEditingController: twoCompartmentController,
                  label: appStrings.compartment,
                  focusNode: focusNodeTwoCompartment,
                  readOnly: true,
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(7),
                      child: appAssets.dropDown.svg(width: 10, height: 10)),
                  labelTextColor: context.scheme().secondaryText,
                  onTap: () {
                    _showTwoCompartmentsDialog(context, (result) {
                      twoCompartmentController.text = result;
                    });
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField.outline(
                  textEditingController: nickNameController,
                  label:appStrings.nickname,
                  focusNode: focusNodeNickName,
                  labelTextColor: context.scheme().secondaryText,
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
                    IconButton(onPressed: () {ShowDialog.sizeInfo(context); },
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
                            labelTextColor: context
                                .scheme()
                                .secondaryText,
                          ),
                          CustomTextField.outline(
                            textEditingController: heightController,
                            label: appStrings.height,
                            focusNode: heightFocusNode,
                            labelTextColor: context
                                .scheme()
                                .secondaryText,
                          ),
                          CustomTextField.outline(
                            textEditingController: lengthController,
                            label: appStrings.length,
                            focusNode: lengthFocusNode,
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
                      icon:const CustomAddPhoto(),
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
                    onPressed: () {
                      widget.bloc.add(
                        TrackerEvent.addBin(
                          bin: Bin(
                            type: BinType.compost,
                            id: null,
                            nickName: nickNameController.text,
                            sizeType: sizeType,
                            amountOfLiters: sizeType == SizeType.litres
                                ? int.parse(amountController.text)
                                : null,
                            isShare: false,
                            imageUrl: file!.path,
                            pickUpDate: null,
                            width: sizeType == SizeType.dimensions ?  widthController.text.trim() : null,
                            length: sizeType == SizeType.dimensions ?  lengthController.text.trim() : null,
                            height: sizeType == SizeType.dimensions ?  heightController.text.trim(): null,
                            typeOfCompostBin: typeOfController.text,
                            is2Compostement:
                                twoCompartmentController.text == 'Yes',
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showCouncilBinDialog(
      BuildContext context, Function(String strResult) onSelectResult) async {
    FocusScope.of(context).unfocus();
    String? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const TypeOfCompostContent();
        });
    if (result != null) onSelectResult(result);
  }

  Future<void> _showTwoCompartmentsDialog(
      BuildContext context, Function(String strResult) onSelectResult) async {
    FocusScope.of(context).unfocus();
    String? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const TwoCompartmentDialog();
        });
    if (result != null) onSelectResult(result);
  }
}
