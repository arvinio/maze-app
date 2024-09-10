import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details_page.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class HaveCompostBinWidget extends StatelessWidget {
  const HaveCompostBinWidget(
      {super.key, required this.haveBinFunc, required this.dontHaveBinFunc});
  final VoidCallback haveBinFunc;
  final VoidCallback dontHaveBinFunc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ExitButton(),
        CustomText(
          "Do you have a \nCompost bin?",
          style: context.titleTitle1,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          "Firstly do you have a compost bin and or a tumbler already?",
          style: context.bodyBody,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomButton.outline(
          text: "I already have one",
          onPressed: haveBinFunc,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton.outline(
          text: "I don't have one",
          onPressed: dontHaveBinFunc,
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          padding: EdgeInsets.all(20.dg),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.dg),
              color: context.scheme().neutralsFieldsTags),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoIcon(),
              SizedBox(height: 10.h),
              CustomText(
                  'We define waste bins, as any container that holds waste before composting.')
            ],
          ),
        )
      ],
    );
  }
}
