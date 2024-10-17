import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_post_response.freezed.dart';
part 'community_post_response.g.dart';

CommunityPostResponse communityLeaderboardResponseFromJson(String str) =>
    CommunityPostResponse.fromJson(json.decode(str));

String communityPostResponseToJson(CommunityPostResponse data) =>
    json.encode(data.toJson());

@freezed
class CommunityPostResponse with _$CommunityPostResponse {
  const factory CommunityPostResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "result") List<CommunityPost>? communityPosts,
  }) = _CommunityPostResponse;

  factory CommunityPostResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostResponseFromJson(json);
}

@freezed
class CommunityPost with _$CommunityPost {
  const factory CommunityPost({
    @JsonKey(name: "_id") final String? id,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "content") final String? content,
    @JsonKey(name: "user") final PostUser? user,
    @JsonKey(name: "likesCount") int? likesCount,
    @JsonKey(name: "commentsCount") final int? commentsCount,
    @JsonKey(name: "createdDate") final DateTime? createdDate,
    @JsonKey(name: "editedDate") final DateTime? editedDate,
    @JsonKey(name: "photos") final List<dynamic>? photos,
    @JsonKey(name: "isLiked") bool? isLiked,
  }) = _CommunityPost;

  factory CommunityPost.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostFromJson(json);

  factory CommunityPost.fromResultJson(Map<String, dynamic> json) =>
      _$CommunityPostFromJson(json["result"]);
}

@freezed
class PostUser with _$PostUser {
  const factory PostUser({
    @JsonKey(name: "_id") final String? id,
    @JsonKey(name: "firstName") final String? firstName,
    @JsonKey(name: "lastName") final String? lastName,
    @JsonKey(name: "avatar") final String? avatar,
    @JsonKey(name: "cover") final String? cover,
  }) = _postUser;

  factory PostUser.fromJson(Map<String, dynamic> json) =>
      _$PostUserFromJson(json);
}
