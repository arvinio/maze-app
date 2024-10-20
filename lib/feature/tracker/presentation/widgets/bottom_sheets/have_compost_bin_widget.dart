import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details/presentation/view/bin_details_page.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/help_header.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class HaveCompostBinWidget extends StatelessWidget {
  const HaveCompostBinWidget(
      {super.key, required this.haveBinFunc, required this.doNotHaveBinFunc});
  final VoidCallback haveBinFunc;
  final VoidCallback doNotHaveBinFunc;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HelpHeader(leadingIcon: PreviousButton()),
          CustomText(
           appStrings.haveCompostBinTitle,
            style: context.titleTitle1,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            appStrings.haveCompostBinSubTitle,
            style: context.bodyBody,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton.outline(
            text: appStrings.alreadyHaveOne,
            onPressed: haveBinFunc,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton.outline(
            text:  appStrings.doNotHaveOne,
            onPressed: doNotHaveBinFunc,
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            padding: EdgeInsets.all(20.dg),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                color: context.scheme().neutralsFieldsTags),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               appAssets.information.svg(width: 24,height: 24),
                SizedBox(height: 10.h),
                CustomText(
                  appStrings.compostBinHelp,style: context.subheadlineSubheadline,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
