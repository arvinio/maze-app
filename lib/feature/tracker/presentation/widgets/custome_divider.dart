import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomeDivider extends StatelessWidget {
  const CustomeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.scheme().neutralsBorderDivider,
      indent: 30.w,
      endIndent: 30.w,
    );
  }
}
