import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custome_tabbar.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CouncilLandfillBinWidget extends StatefulWidget {
  const CouncilLandfillBinWidget({
    super.key,
    required this.bloc,
  });
  final TrackerBloc bloc;

  @override
  State<CouncilLandfillBinWidget> createState() =>
      _CouncilLandfillBinWidgetState();
}

class _CouncilLandfillBinWidgetState extends State<CouncilLandfillBinWidget>
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ExitButton(),
        CustomText(
          "Council landfill bin",
          style: context.titleTitle1,
        ),
        CustomText(
          "Please enter in details below of your council landfill waste bin.",
          style: context.bodyBody,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          "Details*",
          style: context.titleHeadline,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextField.outline(
          textEditingController: nickNameController,
          label: "Nickname",
          focusNode: focusNodeNickName,
          labelTextColor: context.scheme().secondaryText,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextField.outline(
          textEditingController: pickupDateController,
          label: "Council pickup dates",
          focusNode: focusNodePickUpDate,
          labelTextColor: context.scheme().secondaryText,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              "Sizes*",
              style: context.titleHeadline,
            ),
            const InfoIcon()
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        TrackerTabbar(
          tabController: tabController,
          title1: 'Litres',
          title2: 'Dimensions',
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField.outline(
          textEditingController: amountController,
          label: "Amount of litres",
          focusNode: focusNodeAmount,
          labelTextColor: context.scheme().secondaryText,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          "Photo",
          style: context.titleHeadline,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            IconButton.filled(
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
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            SizedBox(
              width: 10.w,
            ),
            if (file != null) ...[
              SizedBox(
                height: 90.h,
                width: 90.h,
                child: Image.file(file!),
              ),
              IconButton(
                  onPressed: () => setState(() {
                        file = null;
                      }),
                  icon: const Icon(Icons.cancel))
            ]
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomButton.submit(
            text: 'Add',
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
    );
  }
}
