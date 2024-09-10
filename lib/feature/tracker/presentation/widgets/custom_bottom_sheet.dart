import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double? height;

  const CustomBottomSheet({
    Key? key,
    required this.title,
    required this.children,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 250.h,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimen.pagePaddingHorizontal,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.scheme().neutralsBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.titleTitle1),
          SizedBox(height: 16.h),
          ...children,
        ],
      ),
    );
  }
}
