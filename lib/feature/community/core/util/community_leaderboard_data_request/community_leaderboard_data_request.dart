


import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_leaderboard_data_request.freezed.dart';


@freezed
class CommunityLeaderboardDataRequest with _$CommunityLeaderboardDataRequest {
  const factory CommunityLeaderboardDataRequest({
    @JsonKey(name: "communityId") String? communityId,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "type") String? type,
  }) = _CommunityLeaderboardDataRequest;

}