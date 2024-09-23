import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_community_response.freezed.dart';
part 'create_community_response.g.dart';

CreateCommunityResponse createCommunityResponseFromJson(String str) => CreateCommunityResponse.fromJson(json.decode(str));

String createCommunityResponseToJson(CreateCommunityResponse data) => json.encode(data.toJson());

@freezed
class CreateCommunityResponse with _$CreateCommunityResponse {
  const factory CreateCommunityResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _CreateCommunityResponse;

  factory CreateCommunityResponse.fromJson(Map<String, dynamic> json) => _$CreateCommunityResponseFromJson(json);
}
