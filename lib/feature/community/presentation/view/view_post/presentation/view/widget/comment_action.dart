import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/presentation/view/widgets/community_action_item.dart';

class CommentAction extends StatelessWidget {
  const CommentAction({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final Widget? icon;
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16.0));
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      borderRadius: borderRadius,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: context.scheme().neutralsBorderDivider)),
        width: 150.w,
        height: 32,
        child: CommunityActionItem(
          icon: icon,
          title: title,
        ),
      ),
    );
  }
}
