

part of 'community_post_bloc.dart';

@freezed
class CommunityPostEvent with _$CommunityPostEvent {
  const factory CommunityPostEvent.init() = _init;
  const factory CommunityPostEvent.postList({required CommunityPostDataRequest request}) = _postList;
  const factory CommunityPostEvent.likePost({required String postId}) = _likePost;
  const factory CommunityPostEvent.unLikePost({required String postId}) = _unLikePost;
}