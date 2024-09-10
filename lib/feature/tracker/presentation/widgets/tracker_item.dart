import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class TrackerItem extends StatelessWidget {
  const TrackerItem({
    super.key,
    required this.amount,
    required this.title,
    required this.isGrayed,
  });

  final int amount;
  final String title;
  final bool isGrayed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amount Kg',
            style: context.titleHeadline.copyWith(
                color: isGrayed ? context.scheme().tertiaryText : null),
          ),
          Text(
            title,
            style: context.captionCaption.copyWith(
                color: isGrayed ? context.scheme().tertiaryText : null),
          ),
        ],
      ),
    );
  }
}
