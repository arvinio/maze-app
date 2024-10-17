import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'community_profile_response.freezed.dart';
part 'community_profile_response.g.dart';

CommunityProfileResponse communityProfileResponseFromJson(String str) => CommunityProfileResponse.fromJson(json.decode(str));

String communityProfileResponseToJson(CommunityProfileResponse data) => json.encode(data.toJson());

@freezed
class CommunityProfileResponse with _$CommunityProfileResponse {
  const factory CommunityProfileResponse({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "username")
    String? username,
    @JsonKey(name: "firstName")
    String? firstName,
    @JsonKey(name: "lastName")
    String? lastName,
    @JsonKey(name: "about")
    String? about,
    @JsonKey(name: "statistics")
    Statistics? statistics,
    @JsonKey(name: "streak")
    Streak? streak,
    @JsonKey(name: "following")
    int? following,
    @JsonKey(name: "avatar")
    String? avatar,
    @JsonKey(name: "cover")
    dynamic cover,
  }) = _CommunityProfileResponse;

  factory CommunityProfileResponse.fromJson(Map<String, dynamic> json) => _$CommunityProfileResponseFromJson(json);
}

@freezed
class Statistics with _$Statistics {
  const factory Statistics({
    @JsonKey(name: "landfill")
    int? landfill,
    @JsonKey(name: "compost")
    int? compost,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);
}

@freezed
class Streak with _$Streak {
  const factory Streak({
    @JsonKey(name: "value")
    int? value,
    @JsonKey(name: "lastEntry")
    DateTime? lastEntry,
    @JsonKey(name: "_id")
    String? id,
  }) = _Streak;

  factory Streak.fromJson(Map<String, dynamic> json) => _$StreakFromJson(json);
}