import 'package:auto_route/auto_route.dart';
import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../../../../core/config/assets/assets.dart';
import '../../../../../../../core/config/dimen.dart';
import '../../../../../../../core/config/strings.dart';
import '../../../../../../../core/presentation/widget/base/base_app_bar.dart';
import '../../../../../../../core/presentation/widget/base/base_page_widget.dart';
import '../../../../../../../core/presentation/widget/custom_menu_items.dart';
import '../../../../../../../core/presentation/widget/custom_text.dart';
import '../../../../../../../core/presentation/widget/custom_text_field.dart';
import '../../../../../../../core/presentation/widget/menu_dialog_content.dart';
import '../../../../../../../core/style/app_theme.dart';
import '../../../../../../../core/util/date_utils.dart';
import '../../../../../../../core/util/extentsion/context_ext.dart';
import '../../../../../../../di/injection_container.dart';
import '../../../../../data/model/community_details_response/community_details_response.dart';
import '../../../widgets/community_actions.dart';
import '../bloc/view_post_bloc.dart';
import 'widget/comment.dart';
import 'widget/comments_header.dart';

@RoutePage()
class ViewPostPage extends StatefulWidget {
  const ViewPostPage({
    super.key,
    required this.postId,
    required this.communityName,
  });

  final String postId;
  final String communityName;

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  final _commentFocusNode = FocusNode();
  final TextEditingController _commentController = TextEditingController();
  List<CommunityDetails>? myCommunities = [];
  List<CommunityDetails>? otherCommunities = [];
  CommunityDetails? details;
  late Logger _logger;

  late ViewPostBloc _viewPostBloc;

  @override
  void initState() {
    super.initState();
    _viewPostBloc = inject<ViewPostBloc>();
    _viewPostBloc.add(ViewPostEvent.getPost(postId: widget.postId));
    _logger = inject<Logger>();
  }

  @override
  void dispose() {
    _commentFocusNode.dispose();
    _viewPostBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBarHeight: 60,
      pagePaddingHorizontal: 0,
      appBar: const BaseAppBar(),
      child: BlocConsumer<ViewPostBloc, ViewPostState>(
        bloc: _viewPostBloc,
        listener: (context, state) {
          if (state.postStatus == PostStatus.success) {
            _viewPostBloc.add(ViewPostEvent.getComments(postId: widget.postId));
          } else if (state.postStatus == PostStatus.failure ||
              state.postStatus == PostStatus.commentsFailure) {
            _logger.e("error: ${state.errorMessage}");
          }
        },
        builder: (context, state) {
          if (state.postStatus == PostStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.post != null) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimen.pagePaddingHorizontal,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: SizedBox(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    state.post!.user?.avatar ??
                                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                  ),
                                ),
                              ),
                              title: CustomText(
                                "${state.post!.user?.firstName ?? ""}${state.post!.user?.lastName ?? ""}",
                                style: context.titleHeadline,
                              ),
                              subtitle: CustomText(
                                '${getDurationString(state.post!.createdDate)} • ${widget.communityName}',
                                style: context.subheadlineSubheadline,
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: appAssets.more.svg(),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                            // Post Content
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              state.post!.title ?? "NA",
                              style: context.titleHeadline,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              state.post!.content ?? "NA",
                              style: context.subheadlineSubheadline,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Post Image
                            Container(
                              height: 220,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: context.scheme().disableButtonBackground,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                state.post!.photos?.first,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Post Actions
                            CommunityActions(
                                title: '${state.post!.likesCount}'),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      // Post Header

                      Divider(
                        color: context.scheme().neutralsBorderDivider,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: CommentsHeaderDelegate(),
                ),
                SliverContainer(
                  sliver: SliverMainAxisGroup(
                    slivers: [
                      state.postStatus == PostStatus.commentsLoading
                          ? const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 300.0,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            )
                          : (state.comments == null || state.comments!.isEmpty
                              ? SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Center(
                                        child: Text(appStrings.noCommentsYet)),
                                  ),
                                )
                              : SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final comment = state.comments![index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Comment(
                                          username:
                                              "${comment.user?.firstName ?? ""}${comment.user?.lastName ?? ""}",
                                          comment: comment.content ?? "NA",
                                          likes: comment.likesCount.toString(),
                                          onPressed: () {
                                            _showOtherCommentsDialog(context);
                                          },
                                        ),
                                      );
                                    },
                                    childCount: state.comments!.length,
                                  ),
                                )),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 58.0,
                        ),
                      )
                    ],
                  ),
                  foreground: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: context.scheme().mainBackground,
                      height: 58.0,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimen.pagePaddingHorizontal,
                          ),
                          child: CustomTextField.slim(
                            textEditingController: _commentController,
                            hint: appStrings.comment,
                            padding: const EdgeInsetsDirectional.only(
                              start: 12.0,
                            ),
                            borderColor: context.scheme().neutralsFieldsTags,
                            maxLines: 1,
                            suffixIcon: InkWell(
                              onTap: () {
                                final text = _commentController.text.trim();
                                if (text.isNotEmpty) {
                                  _viewPostBloc.add(ViewPostEvent.leaveComment(
                                    postId: widget.postId,
                                    content: text,
                                  ));
                                  _commentController.clear();
                                }
                              },
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5.0, 5.0, 0.0, 5.0),
                                  child: appAssets.sendMsgActive
                                      .svg(width: 20, height: 20)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void _showLikeReportPostDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(
              children: [
                CustomMenuItems(
                  title: appStrings.notInterested,
                  leading: appAssets.dislike.svg(),
                  onTap: () {},
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.scheme().neutralsBorderDivider,
                  indent: 60,
                  endIndent: 30,
                ),
                CustomMenuItems(
                  title: appStrings.report,
                  titleColor: context.scheme().error,
                  leading: appAssets.report.svg(),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
    // else toast
  }

  void _showOtherCommentsDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(
              children: [
                CustomMenuItems(
                  title: appStrings.muteUser,
                  leading: appAssets.mute.svg(),
                  onTap: () {},
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.scheme().neutralsBorderDivider,
                  indent: 60,
                  endIndent: 30,
                ),
                CustomMenuItems(
                  title: appStrings.reportUser,
                  leading: appAssets.report.svg(),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
    // else toast
  }

  void _showMyCommentsDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(
              children: [
                CustomMenuItems(
                  title: appStrings.delete,
                  leading: appAssets.delete.svg(),
                  onTap: () {},
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.scheme().neutralsBorderDivider,
                  indent: 60,
                  endIndent: 30,
                ),
                CustomMenuItems(
                  title: appStrings.edit,
                  leading: appAssets.editProfile.svg(),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
    // else toast
  }
}

class PinnedFooterDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  PinnedFooterDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
