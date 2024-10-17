import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/animated_widgets/animated_like.dart';
import 'package:maze_app/core/presentation/widget/custom_Item_divider.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import '../view_post/presentation/bloc/view_post_bloc.dart';
import 'community_action_item.dart';

class CommunityActions extends StatefulWidget {
  const CommunityActions({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<CommunityActions> createState() => _CommunityActionsState();
}

class _CommunityActionsState extends State<CommunityActions> {
  final _animatedLikeKey = GlobalKey<AnimatedLikeState>();

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16.0);
    final viewPostBloc = context.read<ViewPostBloc>();
    return Container(
      width: 400.w,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(radius),
        border: Border.all(
          color: context.scheme().neutralsBorderDivider,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                if (viewPostBloc.state.post?.isLiked ?? false) {
                  viewPostBloc.add(const ViewPostEvent.unLike());
                } else {
                  _animatedLikeKey.currentState?.animate();
                  viewPostBloc.add(const ViewPostEvent.like());
                }
              },
              borderRadius: const BorderRadiusDirectional.only(
                topStart: radius,
                bottomStart: radius,
              ).resolve(Directionality.of(context)),
              child: SizedBox(
                height: 32.0,
                child: CommunityActionItem(
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
                              isLiked: state.post?.isLiked ?? false,
                            )
                            .svg(),
                      );
                    },
                  ),
                  title: widget.title,
                ),
              ),
            ),
          ),
          const CustomItemDivider(),
          Expanded(
            child: CommunityActionItem(
              icon: appAssets.share.svg(),
              title: appStrings.share,
            ),
          ),
        ],
      ),
    );
  }
}
