import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_post_response.freezed.dart';
part 'create_post_response.g.dart';

CreatePostResponse CreatePostResponseFromJson(String str) => CreatePostResponse.fromJson(json.decode(str));

String CreatePostResponseToJson(CreatePostResponse data) => json.encode(data.toJson());

@freezed
class CreatePostResponse with _$CreatePostResponse {
  const factory CreatePostResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _CreatePostResponse;

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) => _$CreatePostResponseFromJson(json);
}
