part of 'view_post_bloc.dart';

@freezed
class ViewPostEvent with _$ViewPostEvent {
  const factory ViewPostEvent.started() = _Started;

  const factory ViewPostEvent.getPost({required String postId}) = _GetPost;

  const factory ViewPostEvent.getComments({required String postId}) =
      _GetComments;

  const factory ViewPostEvent.leaveComment(
      {required String postId, required String content}) = _LeaveComment;

  const factory ViewPostEvent.like() = _Like;

  const factory ViewPostEvent.unLike() = _UnLike;

  const factory ViewPostEvent.likeComment({required int commentIndex}) =
      _LikeComment;

  const factory ViewPostEvent.unLikeComment({required int commentIndex}) =
      _UnLikeComment;

  const factory ViewPostEvent.editComment(
      {required String commentId, required String content}) = _EditComment;

  const factory ViewPostEvent.deleteComment({required int index}) =
      _DeleteComment;

  const factory ViewPostEvent.switchToEditMode({required int index}) =
      _SwitchToEditMode;

  const factory ViewPostEvent.cancelEditMode() = _CancelEditMode;
}
