import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CommunityActionItem extends StatelessWidget {
  const CommunityActionItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final Widget? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon!,
        const SizedBox(width: 5),
        CustomText(title!,
            style: context.subheadlineSubheadline.copyWith(
                color: context
                    .scheme()
                    .secondaryText)),
      ],);
  }
}
