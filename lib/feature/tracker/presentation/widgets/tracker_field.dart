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
    this.horizontalTitleGap,
    this.titleStyle,
    this.subTitleStyle,
    this.isInfoIcon = false,
    this.containerPadding,
    this.trailing,
  });

  final Widget? leadingIcon;
  final String title;
  final String? subTitle;
  final VoidCallback? onTap;
  final double? height;
  final double? horizontalTitleGap;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final bool? isInfoIcon;
  final EdgeInsetsGeometry? containerPadding;
  final Widget? trailing;

@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context
            .scheme()
            .neutralsBorderDivider),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      height: height ?? (leadingIcon == null || isInfoIcon! ? 70.h : 88.h),
      child: Center(
        child: ListTile(
          onTap: onTap,
          title: CustomText(
              title,
              style: titleStyle ?? context.subheadlineSubheadlineSemibold
          ),
          subtitle: subTitle == null
              ? null
              : CustomText(
            subTitle!,
            style:subTitleStyle ?? context.footnoteFootnote
                .copyWith(color: context
                .scheme()
                .secondaryText),
          ),
          leading: leadingIcon == null
              ? null
              : Container(
            height: 50.sp,
            width: 50.sp,
            padding:containerPadding ?? EdgeInsets.all(3.sp),
            decoration: BoxDecoration(
              border: Border.all(
                  color: isInfoIcon! ? Colors.transparent : context
                      .scheme()
                      .neutralsBorderDivider),
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Center(child: leadingIcon),
          ),
          trailing: trailing ?? const AppArrow(),
          horizontalTitleGap: horizontalTitleGap ?? 16,
        ),
      ),
    );
  }
}
