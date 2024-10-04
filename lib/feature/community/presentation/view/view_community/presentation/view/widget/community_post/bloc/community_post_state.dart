part of 'community_post_bloc.dart';

enum CommunityPostStatus {
  init,
  loading,
  success,
  failure,
  likeSuccessful,
  unLikeSuccessful;


  bool get isInit => this == CommunityPostStatus.init;
  bool get isLoading => this == CommunityPostStatus.loading;
  bool get isSuccess => this == CommunityPostStatus.success;
  bool get isFailure=> this == CommunityPostStatus.failure;
  bool get isPostLiked=> this == CommunityPostStatus.likeSuccessful;
  bool get isPostUnLiked=> this == CommunityPostStatus.unLikeSuccessful;
}

@freezed
class CommunityPostState with _$CommunityPostState {
const factory CommunityPostState({
  @Default(CommunityPostStatus.init) CommunityPostStatus state,
  List<CommunityPost>? communityPostList,
  String? likeActionPostId,
  String? errorMessage,

})=_CommunityPostState;
}