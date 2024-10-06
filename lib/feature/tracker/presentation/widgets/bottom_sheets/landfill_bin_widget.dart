import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_add_photo.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_view_photo.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/help_header.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class LandfillBinWidget extends StatefulWidget {
  const LandfillBinWidget({
    super.key,
    required this.bloc,
  });
  final TrackerBloc bloc;

  @override
  State<LandfillBinWidget> createState() => _LandfillBinWidgetState();
}

class _LandfillBinWidgetState extends State<LandfillBinWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController pickupDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final focusNodeNickName = FocusNode();
  final focusNodePickUpDate = FocusNode();
  final focusNodeAmount = FocusNode();

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 24,bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelpHeader(leadingIcon: PreviousButton()),
            CustomText(
              appStrings.landfillBinTitle,
              style: context.titleTitle1,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
            appStrings.landfillBinSubTitle,
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
              label:  appStrings.nickname,
              focusNode: focusNodeNickName,
              labelTextColor: context.scheme().secondaryText,
            ),
            SizedBox(
              height: 10.h,
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
            CustomTextField.outline(
              textEditingController: amountController,
              label: appStrings.amountLitres,
              focusNode: focusNodeAmount,
              labelTextColor: context.scheme().secondaryText,
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          .pickImage(source: ImageSource.gallery);
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
                  icon: const CustomAddPhoto(),
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
                        type: BinType.landfill,
                        id: null,
                        nickName: nickNameController.text,
                        sizeType: sizeType,
                        amountOfLiters: sizeType == SizeType.litres
                            ? int.parse(amountController.text)
                            : null,
                        isShare: false,
                        imageUrl: file!.path,
                        pickUpDate: pickupDateController.text,
                        width: sizeType == SizeType.dimensions ? '20' : null,
                        length: sizeType == SizeType.dimensions ? '20' : null,
                        height: sizeType == SizeType.dimensions ? '20' : null,
                        typeOfCompostBin: '',
                        is2Compostement: null,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
