part of 'view_post_bloc.dart';

enum PostStatus {
  init,
  loading,
  success,
  failure,
  commentsLoading,
  commentsSuccess,
  commentsFailure;

  bool get isInit => this == PostStatus.init;

  bool get isLoading => this == PostStatus.loading;

  bool get isSuccess => this == PostStatus.success;

  bool get isFailure => this == PostStatus.failure;

  bool get isCommentsLoading => this == PostStatus.commentsLoading;

  bool get isCommentsSuccess => this == PostStatus.commentsSuccess;

  bool get isCommentsFailure => this == PostStatus.commentsFailure;
}

@freezed
class ViewPostState with _$ViewPostState {
  const factory ViewPostState(
      {@Default(PostStatus.init) PostStatus postStatus,
      CommunityPost? post,
      List<PostCommentResponse>? comments,
      PostCommentResponse? editingComment,
      String? errorMessage}) = _ViewPostState;
}
