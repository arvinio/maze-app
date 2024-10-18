import 'package:auto_route/auto_route.dart';
import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_app_bar.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart'
    show BasePageWidget;
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/dismissible_focus.dart';
import 'package:maze_app/core/presentation/widget/ignore_overflow.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/date_utils.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/presentation/bloc/view_post_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/presentation/widgets/comment.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/presentation/widgets/comments_header.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/presentation/widgets/community_actions.dart';

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
    return BlocProvider.value(
      value: _viewPostBloc,
      child: BasePageWidget(
        appBarHeight: 60,
        pagePaddingHorizontal: 0,
        appBar: const BaseAppBar(),
        child: BlocConsumer<ViewPostBloc, ViewPostState>(
          bloc: _viewPostBloc,
          listener: (context, state) {
            if (state.postStatus.isSuccess) {
              _viewPostBloc
                  .add(ViewPostEvent.getComments(postId: widget.postId));
            } else if (state.postStatus.isFailure ||
                state.postStatus.isCommentsFailure) {
              _logger.e("error: ${state.errorMessage}");
            }
          },
          builder: (context, state) {
            if (state.postStatus.isLoading) {
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
                                // trailing: IconButton(
                                //   onPressed: () {},
                                //   icon: appAssets.more.svg(),
                                // ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              // Post Content
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                state.post!.title ?? " ",
                                style: context.titleHeadline,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                state.post!.content ?? " ",
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
                                  color:
                                      context.scheme().disableButtonBackground,
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
                        state.postStatus.isCommentsLoading
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Center(
                                          child:
                                              Text(appStrings.noCommentsYet)),
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
                                            comment: comment,
                                            onPressed: () {
                                              _showOtherCommentsDialog(
                                                context,
                                                index: index,
                                              );
                                            },
                                            index: index,
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
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        color: context.scheme().mainBackground,
                        height: state.editingComment == null ? 58.0 : 106.0,
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimen.pagePaddingHorizontal,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: IgnoreOverflow(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    if (state.editingComment != null) ...[
                                      _buildEditContainer(),
                                    ],
                                    CustomTextField.slim(
                                      textEditingController: _commentController,
                                      hint: appStrings.comment,
                                      padding: const EdgeInsetsDirectional.only(
                                        start: 12.0,
                                      ),
                                      borderColor:
                                          context.scheme().neutralsFieldsTags,
                                      maxLines: 1,
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          final text =
                                              _commentController.text.trim();
                                          if (text.isNotEmpty) {
                                            if (state.editingComment != null) {
                                              _viewPostBloc.add(
                                                  ViewPostEvent.editComment(
                                                commentId:
                                                    state.editingComment!.id!,
                                                content: text,
                                              ));
                                              dismissFocus(context);
                                            } else {
                                              _viewPostBloc.add(
                                                  ViewPostEvent.leaveComment(
                                                postId: widget.postId,
                                                content: text,
                                              ));
                                            }
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
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                ),
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

  void _showOtherCommentsDialog(BuildContext context, {required int index}) {
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
                  onTap: () {
                    _viewPostBloc
                        .add(ViewPostEvent.deleteComment(index: index));
                    Navigator.of(context).pop();
                  },
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
                  onTap: () {
                    _commentController.text =
                        _viewPostBloc.state.comments![index].content ?? "";
                    _viewPostBloc
                        .add(ViewPostEvent.switchToEditMode(index: index));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
    // else toast
  }

  Widget _buildEditContainer() {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            24.0,
          ),
        ),
        border: Border.all(
          color: context.scheme().dividerColor,
        ),
      ),
      height: 44.0,
      padding: const EdgeInsetsDirectional.only(
        start: 16.0,
        top: 2.0,
        bottom: 2.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appStrings.editComment,
                    style: context.footnoteFootnoteBold,
                  ),
                  Text(
                    _viewPostBloc.state.editingComment!.content ?? " ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: context.footnoteFootnote,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _commentController.clear();
              dismissFocus(context);
              _viewPostBloc.add(const ViewPostEvent.cancelEditMode());
            },
            icon: appAssets.close.svg(),
          ),
        ],
      ),
    );
  }

// void _showMyCommentsDialog(BuildContext context) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (builder) {
//         return MenuDialogContent(
//           header: appStrings.options,
//           dialogHeightPercent: 0.32,
//           child: Column(
//             children: [
//               CustomMenuItems(
//                 title: appStrings.delete,
//                 leading: appAssets.delete.svg(),
//                 onTap: () {},
//               ),
//               Divider(
//                 height: 1,
//                 thickness: 1,
//                 color: context.scheme().neutralsBorderDivider,
//                 indent: 60,
//                 endIndent: 30,
//               ),
//               CustomMenuItems(
//                 title: appStrings.edit,
//                 leading: appAssets.editProfile.svg(),
//                 onTap: () {},
//               ),
//             ],
//           ),
//         );
//       });
//   // else toast
// }
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
