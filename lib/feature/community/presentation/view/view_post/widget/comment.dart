import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/app.dart';
import 'package:maze_app/core/presentation/widget/bottom_navigation.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/widget/comment_action.dart';
import 'package:maze_app/feature/community/presentation/view/widgets/community_action_item.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custome_divider.dart';

class Comment extends StatelessWidget {
  final String username;
  final String comment;
  final String likes;
  final void Function()? onPressed;

  Comment({required this.username, required this.comment, required this.likes, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimen.defaultRadius),
            border: Border.all(color: context
                .scheme()
                .neutralsBorderDivider)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: ExactAssetImage(
                    appAssets.profile.path) /* NetworkImage()*/,
              ),
              title: CustomText(
                username, style: context.subheadlineSubheadlineMedium,),
              trailing:IconButton(onPressed:onPressed, icon: appAssets.more.svg()),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomText(
                comment,
                style: context.subheadlineSubheadline,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                CommentAction(icon: appAssets.heart.svg(width: 16, height: 16),
                    title: likes),
                CommentAction(icon: appAssets.share.svg(width: 16, height: 16),
                    title: appStrings.share)
              ],)

          ],)
    );
  }
}