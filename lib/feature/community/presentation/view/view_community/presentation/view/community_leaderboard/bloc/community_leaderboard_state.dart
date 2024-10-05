
part of 'community_leaderboard_bloc.dart';


enum CommunityLeaderboardStatus {
  init,
  loading,
  success,
  failure;


  bool get isInit => this == CommunityLeaderboardStatus.init;
  bool get isLoading => this == CommunityLeaderboardStatus.loading;
  bool get isSuccess => this == CommunityLeaderboardStatus.success;
  bool get isFailure=> this == CommunityLeaderboardStatus.failure;

}

@freezed
class CommunityLeaderboardState with _$CommunityLeaderboardState{
  const factory CommunityLeaderboardState({
    @Default(CommunityLeaderboardStatus.init) CommunityLeaderboardStatus communityLeaderboardStatus,
    String? errorMessage,
    List<CommunityLeaderboard>? communityLeaderboards,

  })=_CommunityLeaderboardState;
}