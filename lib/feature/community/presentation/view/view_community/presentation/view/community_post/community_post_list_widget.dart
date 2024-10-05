import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/core/util/community_post_data_request/community_post_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_post/bloc/community_post_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_post/cummunity_post_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/try_again_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CommunityPostListWidget extends StatefulWidget {
  const CommunityPostListWidget({
    super.key,
    required this.communityId,
  });

  final String communityId;

  @override
  State<CommunityPostListWidget> createState() =>
      _CommunityPostListWidgetState();
}

class _CommunityPostListWidgetState extends State<CommunityPostListWidget>
    with AutomaticKeepAliveClientMixin {
  List<CommunityPost>? postList;

  @override
  void initState() {
    super.initState();
    onResume();
  }

  void onResume() {
    context.read<CommunityPostBloc>().add(CommunityPostEvent.postList(
            request: CommunityPostDataRequest(
          communityId: widget.communityId,
          page: 1,
        )));
  }

  List<CommunityPost> updatePostLikeState(CommunityPostState state) {
    final mutablePostList = List<CommunityPost>.from(postList!);
    final int currentPostIndex = mutablePostList
        .indexWhere((element) => element.id == state.likeActionPostId);
    if (currentPostIndex != -1) {
      final currentPost = mutablePostList[currentPostIndex];
      mutablePostList[currentPostIndex] = currentPost.copyWith(
        isLiked: state.state == CommunityPostStatus.likeSuccessful,
        likesCount: state.state == CommunityPostStatus.likeSuccessful
            ? (currentPost.likesCount ?? 0) + 1
            : (currentPost.likesCount ?? 1) - 1,
      );
      postList = mutablePostList;
    }
    return mutablePostList;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<CommunityPostBloc, CommunityPostState>(
      builder: (context, state) {
        if (state.state == CommunityPostStatus.failure) {
          return TryAgainWidget(tryAgainCallback: onResume);
        } else if (state.state == CommunityPostStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == CommunityPostStatus.likeSuccessful ||
            state.state == CommunityPostStatus.unLikeSuccessful) {
          if (postList != null) {
            postList = updatePostLikeState(state);
          }
          return body(state.copyWith(communityPostList: postList));
        }
        return body(state);
      },
    );
  }

  Widget body(CommunityPostState state) {
    postList = state.communityPostList ?? [];
    if (state.state == CommunityPostStatus.success && postList!.isEmpty) {
      return Center(child: Text(appStrings.listIsEmpty));
    } else if (postList!.isNotEmpty) {
      return ListView.separated(
        itemCount: postList!.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CommunityPostWidget(post: postList![index]);
        },
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: context.scheme().tabBarBorderDivider,
        ),
      );
    }
    return const SizedBox();
  }

  @override
  bool get wantKeepAlive => true;
}
