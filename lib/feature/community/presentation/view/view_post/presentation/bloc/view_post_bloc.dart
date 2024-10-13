import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/data/model/post_comments/post_comment.dart';

import '../../../../../domain/repository/community_repository.dart';

part 'view_post_bloc.freezed.dart';
part 'view_post_event.dart';
part 'view_post_state.dart';

@injectable
class ViewPostBloc extends Bloc<ViewPostEvent, ViewPostState> {
  final CommunityRepository repository;

  ViewPostBloc(this.repository) : super(const ViewPostState()) {
    on<_GetPost>(_onGetPost);
    on<_LeaveComment>(_onLeaveComment);
    on<_GetComments>(_onGetComments);
  }

  FutureOr<void> _onGetPost(_GetPost event, Emitter<ViewPostState> emit) async {
    emit(state.copyWith(
      postStatus: PostStatus.loading,
    ));
    final post = await repository.getPost(postId: event.postId);

    post.when(
      completed: (post, _) {
        emit(state.copyWith(
          postStatus: PostStatus.success,
          post: post,
        ));
      },
      error: (error) {
        emit(state.copyWith(
          postStatus: PostStatus.failure,
          errorMessage: error.message,
        ));
      },
    );
  }

  FutureOr<void> _onLeaveComment(
      _LeaveComment event, Emitter<ViewPostState> emit) async {
    emit(
      state.copyWith(
        comments: [
          PostCommentResponse(
            content: event.content,
            isLiked: false,
            createdDate: DateTime.now(),
            likesCount: 0,
            replies: [],
          ),
          if (state.comments != null) ...state.comments!,
        ],
      ),
    );
    final result = await repository.leaveComment(
        body: CommentRequest(
      content: event.content,
      postId: event.postId,
    ));

    result.when(
        completed: (_, __) {},
        error: (error) {
          emit(state.copyWith(
            errorMessage: error.message,
          ));
        });
  }

  FutureOr<void> _onGetComments(
      _GetComments event, Emitter<ViewPostState> emit) async {
    emit(state.copyWith(
      postStatus: PostStatus.commentsLoading,
    ));

    final comments = await repository.getComments(
      postId: event.postId,
    );

    comments.when(
      completed: (comments, _) {
        emit(state.copyWith(
          postStatus: PostStatus.commentsSuccess,
          comments: comments,
        ));
      },
      error: (error) {
        emit(state.copyWith(
          postStatus: PostStatus.commentsFailure,
          errorMessage: error.message,
        ));
      },
    );
  }
}
