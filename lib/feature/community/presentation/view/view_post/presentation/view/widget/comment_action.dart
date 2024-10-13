import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/presentation/view/widgets/community_action_item.dart';

class CommentAction extends StatelessWidget {
  const CommentAction({
    super.key,
    required this.icon,
    required this.title,
  });

  final Widget? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return        Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: context
              .scheme()
              .neutralsBorderDivider)
      ),
      width: 150.w,
      height: 32,
      child: CommunityActionItem(
        icon:icon,
        title: title,
      ),
    );
  }
}
