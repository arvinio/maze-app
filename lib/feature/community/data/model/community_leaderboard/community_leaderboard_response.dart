import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'community_leaderboard_response.g.dart';
part 'community_leaderboard_response.freezed.dart';


CommunityLeaderboardResponse communityLeaderboardResponseFromJson(String str) => CommunityLeaderboardResponse.fromJson(json.decode(str));

String communityLeaderboardResponseToJson(CommunityLeaderboardResponse data) => json.encode(data.toJson());

@freezed
class CommunityLeaderboardResponse with _$CommunityLeaderboardResponse{

  const factory CommunityLeaderboardResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<CommunityLeaderboard>? communityLeaderboards,
  }) = _CommunityLeaderboardResponse;

  factory CommunityLeaderboardResponse.fromJson(Map<String, dynamic> json) => _$CommunityLeaderboardResponseFromJson(json);

}

@freezed
class CommunityLeaderboard with _$CommunityLeaderboard{

  const factory CommunityLeaderboard({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "firstName")
    String? firstName,
    @JsonKey(name: "lastName")
    String? lastName,
    @JsonKey(name: "statistics")
    Map<String , dynamic>? statistics,
    @JsonKey(name: "avatar")
    String? avatar,
    @JsonKey(name: "cover")
    String? cover,

}) =_CommunityLeaderboard;

  factory CommunityLeaderboard.fromJson(Map<String, dynamic> json) => _$CommunityLeaderboardFromJson(json);
}