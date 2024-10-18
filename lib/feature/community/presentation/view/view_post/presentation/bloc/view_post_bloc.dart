import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/data/model/post_comments/post_comment.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

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
    on<_Like>(_onLike);
    on<_UnLike>(_onUnLike);
    on<_LikeComment>(_onLikeComment);
    on<_UnLikeComment>(_onUnLikeComment);
    on<_EditComment>(_onEditComment);
    on<_DeleteComment>(_onDeleteComment);
    on<_SwitchToEditMode>(_onSwitchToEditMode);
    on<_CancelEditMode>(_onCancelEditMode);
  }

  void _likeComment(int index, Emitter<ViewPostState> emit) {
    final hasComments = state.comments != null && state.comments!.isNotEmpty;
    if (hasComments) {
      final comment = state.comments![index];
      final comments = _editComment(
          index,
          comment.copyWith(
            isLiked: true,
            likesCount: (comment.likesCount ?? 0) + 1,
          ));
      emit(state.copyWith(
        comments: comments,
      ));
    }
  }

  List<PostCommentResponse> _editComment(
      int index, PostCommentResponse comment) {
    final comments = List<PostCommentResponse>.from(state.comments!);
    comments[index] = comment;
    return comments;
  }

  void _unLikeComment(int index, Emitter<ViewPostState> emit) {
    final hasComments = state.comments != null && state.comments!.isNotEmpty;
    if (hasComments) {
      final comments = List<PostCommentResponse>.from(state.comments!);
      final comment = comments[index];
      comments[index] = comment.copyWith(
        isLiked: false,
        likesCount: (comment.likesCount ?? 1) - 1,
      );
      emit(state.copyWith(
        comments: comments,
      ));
    }
  }

  FutureOr<void> _onLikeComment(
      _LikeComment event, Emitter<ViewPostState> emit) async {
    final comment = state.comments?[event.commentIndex];
    if (comment != null) {
      _likeComment(event.commentIndex, emit);

      final result = await repository.likeComment(commentId: comment.id!);
      result.when(
        completed: (_, __) {},
        error: (error) {
          _unLikeComment(event.commentIndex, emit);
        },
      );
    }
  }

  FutureOr<void> _onUnLikeComment(
      _UnLikeComment event, Emitter<ViewPostState> emit) async {
    final comment = state.comments?[event.commentIndex];
    if (comment != null) {
      _unLikeComment(event.commentIndex, emit);

      final result = await repository.unLikeComment(commentId: comment.id!);
      result.when(
        completed: (_, __) {},
        error: (error) {
          _likeComment(event.commentIndex, emit);
        },
      );
    }
  }

  void _like(Emitter<ViewPostState> emit) {
    emit(state.copyWith(
        post: state.post?.copyWith(
      isLiked: true,
      likesCount: (state.post!.likesCount ?? 0) + 1,
    )));
  }

  void _unLike(Emitter<ViewPostState> emit) {
    emit(state.copyWith(
        post: state.post?.copyWith(
      isLiked: false,
      likesCount: (state.post!.likesCount ?? 1) - 1,
    )));
  }

  bool _isSendingLikeRequest = false;

  FutureOr<void> _onLike(_Like event, Emitter<ViewPostState> emit) async {
    if (!_isSendingLikeRequest &&
        state.post != null &&
        state.post!.id != null) {
      _like(emit);
      _isSendingLikeRequest = true;
      final result = await repository.likePost(postId: state.post!.id!);
      result.when(
        completed: (_, __) {
          _isSendingLikeRequest = false;
        },
        error: (error) {
          _isSendingLikeRequest = false;
          _unLike(emit);
        },
      );
    }
  }

  FutureOr<void> _onUnLike(_UnLike event, Emitter<ViewPostState> emit) async {
    if (!_isSendingLikeRequest &&
        state.post != null &&
        state.post!.id != null) {
      _unLike(emit);
      _isSendingLikeRequest = true;
      final result = await repository.unLikePost(postId: state.post!.id!);
      result.when(
        completed: (_, __) {
          _isSendingLikeRequest = false;
        },
        error: (error) {
          _isSendingLikeRequest = false;
          _like(emit);
        },
      );
    }
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

  FutureOr<void> _onEditComment(
      _EditComment event, Emitter<ViewPostState> emit) async {
    final index =
        state.comments!.indexWhere((comment) => comment.id == event.commentId);
    final comment = state.comments![index];
    final comments = _editComment(
      index,
      comment.copyWith(
        content: event.content,
      ),
    );

    emit(
      ViewPostState(
        comments: comments,
        postStatus: state.postStatus,
        post: state.post,
        errorMessage: state.errorMessage,
        editingComment: null,
      ),
    );

    final result = await repository.editComment(
        body: EditCommentRequest(
      content: event.content,
      commentId: event.commentId,
    ));

    result.when(
        completed: (_, __) {},
        error: (error) {
          final comments = _editComment(index, comment);
          emit(state.copyWith(
            comments: comments,
            errorMessage: error.message,
          ));
        });
  }

  List<PostCommentResponse> _deleteComment(int index) {
    final comments = List<PostCommentResponse>.from(state.comments!);
    comments.removeAt(index);
    return comments;
  }

  List<PostCommentResponse> _insertComment(
      int index, PostCommentResponse comment) {
    final comments = List<PostCommentResponse>.from(state.comments!);
    comments.insert(index, comment);
    return comments;
  }

  FutureOr<void> _onDeleteComment(
      _DeleteComment event, Emitter<ViewPostState> emit) async {
    final comment = state.comments![event.index];
    final comments = _deleteComment(event.index);
    emit(
      state.copyWith(
        comments: comments,
      ),
    );
    final result = await repository.deleteComment(
      commentId: comment.id!,
    );

    result.when(
        completed: (_, __) {},
        error: (error) {
          final comments = _insertComment(event.index, comment);
          emit(state.copyWith(
            comments: comments,
            errorMessage: error.message,
          ));
        });
  }

  FutureOr<void> _onSwitchToEditMode(
      _SwitchToEditMode event, Emitter<ViewPostState> emit) {
    emit(
      state.copyWith(
        editingComment: state.comments![event.index],
      ),
    );
  }

  FutureOr<void> _onCancelEditMode(
      _CancelEditMode event, Emitter<ViewPostState> emit) {
    emit(
      ViewPostState(
        comments: state.comments,
        postStatus: state.postStatus,
        post: state.post,
        errorMessage: state.errorMessage,
        editingComment: null,
      ),
    );
  }
}
