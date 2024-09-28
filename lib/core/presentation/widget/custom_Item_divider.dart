import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomItemDivider extends StatelessWidget {
  const CustomItemDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      indent:5,
      endIndent: 5,
      color: context.scheme().neutralsBorderDivider,
    );
  }
}
