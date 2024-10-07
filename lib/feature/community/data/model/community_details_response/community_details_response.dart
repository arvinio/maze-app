// To parse this JSON data, do
//
//     final communityInfoResponse = communityInfoResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'community_details_response.freezed.dart';
part 'community_details_response.g.dart';

CommunityDetailsResponse communityDetailsResponseFromJson(String str) => CommunityDetailsResponse.fromJson(json.decode(str));

String communityDetailsResponseToJson(CommunityDetailsResponse data) => json.encode(data.toJson());

@freezed
class CommunityDetailsResponse with _$CommunityDetailsResponse {
  const factory CommunityDetailsResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    CommunityDetails? communityDetails,
  }) = _CommunityDetailsResponse;

  factory CommunityDetailsResponse.fromJson(Map<String, dynamic> json) => _$CommunityDetailsResponseFromJson(json);
}

@freezed
class CommunityDetails with _$CommunityDetails {
  const factory CommunityDetails({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "description")
    String? description,
    @JsonKey(name: "memberCount")
    int? memberCount,
    @JsonKey(name: "avatar")
    String? avatar,
    @JsonKey(name: "cover")
    String? cover,
    @JsonKey(name: "isOwner")
    bool? isOwner,
  }) = _CommunityDetails;

  factory CommunityDetails.fromJson(Map<String, dynamic> json) => _$CommunityDetailsFromJson(json);
}