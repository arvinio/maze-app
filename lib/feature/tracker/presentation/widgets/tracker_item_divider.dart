import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class TrackerItemDivider extends StatelessWidget {
  const TrackerItemDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      indent: 13.h,
      endIndent: 13.h,
      color: context.scheme().neutralsBorderDivider,
    );
  }
}
