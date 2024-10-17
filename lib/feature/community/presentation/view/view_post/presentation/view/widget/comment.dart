import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import '../../../../../../../../core/presentation/animated_widgets/animated_like.dart';
import '../../../../../../data/model/post_comments/post_comment.dart';
import '../../bloc/view_post_bloc.dart';
import 'comment_action.dart';

class Comment extends StatefulWidget {
  final String username;
  final PostCommentResponse comment;
  final void Function()? onPressed;
  final int index;

  const Comment({
    super.key,
    required this.username,
    required this.comment,
    required this.onPressed,
    required this.index,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final _animatedLikeKey = GlobalKey<AnimatedLikeState>();

  @override
  Widget build(BuildContext context) {
    final viewPostBloc = context.read<ViewPostBloc>();
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimen.defaultRadius),
            border: Border.all(color: context.scheme().neutralsBorderDivider)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    ExactAssetImage(appAssets.profile.path) /* NetworkImage()*/,
              ),
              title: CustomText(
                widget.username,
                style: context.subheadlineSubheadlineMedium,
              ),
              // trailing:
              //     IconButton(onPressed: onPressed, icon: appAssets.more.svg()),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomText(
                widget.comment.content ?? " ",
                style: context.subheadlineSubheadline,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommentAction(
                  icon: BlocBuilder<ViewPostBloc, ViewPostState>(
                    bloc: viewPostBloc,
                    builder: (context, state) {
                      return AnimatedLike(
                        key: _animatedLikeKey,
                        animatingChildren: [
                          appAssets.heart.svg(color: context.scheme().error),
                        ],
                        animateOnTap: false,
                        child: appAssets
                            .heartIcon(
                              isLiked: (state.comments![widget.index].isLiked ??
                                  false),
                            )
                            .svg(
                              width: 16.0,
                              height: 16.0,
                            ),
                      );
                    },
                  ),
                  title: (widget.comment.likesCount ?? 0).toString(),
                  onTap: () {
                    if (viewPostBloc.state.comments![widget.index].isLiked ??
                        false) {
                      viewPostBloc.add(ViewPostEvent.unLikeComment(
                        commentIndex: widget.index,
                      ));
                    } else {
                      _animatedLikeKey.currentState?.animate();
                      viewPostBloc.add(ViewPostEvent.likeComment(
                        commentIndex: widget.index,
                      ));
                    }
                  },
                ),
                CommentAction(
                  icon: appAssets.share.svg(width: 16, height: 16),
                  title: appStrings.share,
                )
              ],
            )
          ],
        ));
  }
}
