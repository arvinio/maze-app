import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class AppArrow extends StatelessWidget {
  const AppArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  appAssets.rightArrow.svg(color: context.scheme().tertiaryText);
      /*SizedBox(
      height: 15.sp,
      width: 15.sp,
      child: Icon(
        Icons.arrow_forward_ios,
        color: context.scheme().tertiaryText,
      ),
    )*/;
  }
}
