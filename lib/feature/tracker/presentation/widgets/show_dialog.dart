
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class ShowDialog{
  static void sizeInfo(
      BuildContext context,)  {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return  MenuDialogContent(
            header: appStrings.info,
            dialogHeightPercent: 0.25,
            color: Colors.transparent,
            child: CustomText(appStrings.infoMsg,style: context.bodyBody));
        });

  }

  static Future<dynamic> openModalBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context.scheme().neutralsBackground,
      context: context,
      builder: (context) {
        return Container(
          height: 780.h,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimen.pagePaddingHorizontal,
          ),
          child: child,
        );
      },
    );
  }
}