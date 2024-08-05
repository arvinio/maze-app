import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class TrackerField extends StatelessWidget {
  const TrackerField({
    super.key,
    this.leadingIcon,
    required this.title,
    this.subTitle,
    required this.onTap,
    this.height,
  });

  final Widget? leadingIcon;
  final String title;
  final String? subTitle;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.scheme().neutralsBorderDivider),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      height: height ?? (leadingIcon == null ? 70.h : 88.h),
      child: Center(
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: context.subheadlineSubheadline.copyWith(
              color: context.scheme().primaryText,
            ),
          ),
          subtitle: subTitle == null
              ? null
              : CustomText(
                  subTitle!,
                  style: context.footnoteFootnote
                      .copyWith(color: context.scheme().secondaryText),
                ),
          leading: leadingIcon == null
              ? null
              : Container(
                  height: 50.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: context.scheme().neutralsBorderDivider),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Center(child: leadingIcon),
                ),
          trailing: const AppArrow(),
        ),
      ),
    );
  }
}
