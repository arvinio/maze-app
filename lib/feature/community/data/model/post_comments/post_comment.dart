import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_comment.freezed.dart';
part 'post_comment.g.dart';

@freezed
class PostCommentResponse with _$PostCommentResponse {
  const factory PostCommentResponse({
    @JsonKey(name: "_id") final String? id,
    @JsonKey(name: "content") final String? content,
    @JsonKey(name: "user") final CommentUser? user,
    @JsonKey(name: "replies") final List<PostCommentResponse>? replies,
    @JsonKey(name: "likesCount") int? likesCount,
    @JsonKey(name: "createdDate") final DateTime? createdDate,
    @JsonKey(name: "isLiked") bool? isLiked,
  }) = _PostCommentResponse;

  factory PostCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$PostCommentResponseFromJson(json);

  static List<PostCommentResponse> listFromJson(Map<String, dynamic> json) {
    final list = json["result"] as List;
    return list
        .map((element) => _$PostCommentResponseFromJson(element))
        .toList();
  }
}

@freezed
class CommentUser with _$CommentUser {
  const factory CommentUser({
    @JsonKey(name: "_id") final String? id,
    @JsonKey(name: "firstName") final String? firstName,
    @JsonKey(name: "lastName") final String? lastName,
    @JsonKey(name: "avatar") final String? avatar,
    @JsonKey(name: "cover") final String? cover,
  }) = _commentUser;

  factory CommentUser.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFromJson(json);
}

@freezed
class CommentRequest with _$CommentRequest {
  const factory CommentRequest({
    @JsonKey(name: "content") final String? content,
    @JsonKey(name: "postId") final String? postId,
  }) = _commentRequest;

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);
}
