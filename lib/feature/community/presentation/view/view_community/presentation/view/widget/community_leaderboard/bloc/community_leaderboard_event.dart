part of 'community_leaderboard_bloc.dart';

@freezed
class CommunityLeaderboardEvent with _$CommunityLeaderboardEvent{
  const factory CommunityLeaderboardEvent.init() = _Init;
  const factory CommunityLeaderboardEvent.leaderboardList({required CommunityLeaderboardDataRequest request}) = _leaderboardList;
  const factory CommunityLeaderboardEvent.leaveCommunity({required String id}) = _leaveCommunity;
}