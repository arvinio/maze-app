import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key, this.indent, this.endIndent
  });

  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context
          .scheme()
          .neutralsBorderDivider,
      indent: indent ?? 30.w,
      endIndent: endIndent ?? 30.w,
    );
  }
}
