import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/network/util/timeago_extention.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_post/bloc/community_post_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_post/photos_carousel_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/circle_avatar_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CommunityPostWidget extends StatefulWidget {
  const CommunityPostWidget({
    super.key,
    required this.post,
  });

  final CommunityPost post;

  @override
  State<CommunityPostWidget> createState() => _CommunityPostWidgetState();
}

class _CommunityPostWidgetState extends State<CommunityPostWidget> {
  @override
  Widget build(BuildContext context) {
    final args = context.routeData.argsAs<ViewCommunityPageRouteArgs>();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (widget.post.id != null) {
            context.router.push(
              ViewPostPageRoute(
                postId: widget.post.id!,
                communityName: args.communityDetails.name ?? "NA",
              ),
            );
          } else {
            debugPrint("this post has no id!!!!!!");
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatarWidget(
                    url: widget.post.user?.avatar,
                    width: 44.h,
                    height: 44.h,
                    type: 'network',
                    onTab: () {},
                    placeHolder: appAssets.personPlaceHolderImage.image(),
                  ),
                  const SizedBox(
                    width: Dimen.screenSidePadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.post.user?.firstName ?? ''}${widget.post.user?.lastName ?? ''}',
                        style: context.titleHeadline,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.post.createdDate?.timeAgo ?? '',
                            style: context.subheadlineSubheadline,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          appAssets.dot.svg(),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            widget.post.title ?? '',
                            style: context.subheadlineSubheadline,
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: appAssets.menuIcon.svg(
                          color: context.scheme().tertiaryText,
                        )),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
              const SizedBox(
                height: Dimen.screenSidePadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.content ?? '',
                    style: context.subheadlineSubheadline,
                  ),
                  const SizedBox(
                    height: Dimen.screenSidePadding,
                  ),
                  if (widget.post.photos?.isNotEmpty == true)
                    PhotoCarouselWidget(
                      photoUrls: widget.post.photos!,
                      height: 220.h,
                    ),
                  const SizedBox(
                    height: Dimen.screenSidePadding,
                  ),
                  Container(
                    width: double.infinity,
                    height: 32.h,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                      border: Border.all(
                        color: context.scheme().tabBarBorderDivider,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (widget.post.isLiked == true) {
                                context.read<CommunityPostBloc>().add(
                                    CommunityPostEvent.unLikePost(
                                        postId: widget.post.id!));
                              } else {
                                context.read<CommunityPostBloc>().add(
                                    CommunityPostEvent.likePost(
                                        postId: widget.post.id!));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                appAssets
                                    .heartIcon(
                                        isLiked: widget.post.isLiked == true)
                                    .svg(
                                      height: 16.h,
                                      width: 16.h,
                                    ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  widget.post.likesCount.toString(),
                                  style: context.subheadlineSubheadline,
                                )
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: context.scheme().tabBarBorderDivider,
                          thickness: 1,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appAssets.message.svg(height: 16.h, width: 16.h),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              widget.post.commentsCount.toString(),
                              style: context.subheadlineSubheadline,
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
