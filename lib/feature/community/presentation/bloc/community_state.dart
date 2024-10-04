part of 'community_bloc.dart';

enum CommunityStatus {
  init,
  loading,
  success,
  failure,
  myCommunityLoading,
  myCommunitySuccess,
  myCommunityFailure,
  otherCommunitiesLoading,
  otherCommunitiesSuccess,
  otherCommunitiesFailure;

  bool get isInit => this == CommunityStatus.init;
  bool get isLoading => this == CommunityStatus.loading;
  bool get isSuccess => this == CommunityStatus.success;
  bool get isFailure => this == CommunityStatus.failure;
  bool get isMyCommunityLoading => this == CommunityStatus.myCommunityLoading;
  bool get isMyCommunitySuccess => this == CommunityStatus.myCommunitySuccess;
  bool get isMyCommunityFailure => this == CommunityStatus.myCommunityFailure;
  bool get isOtherCommunitiesLoading =>
      this == CommunityStatus.otherCommunitiesLoading;
  bool get isOtherCommunitiesSuccess =>
      this == CommunityStatus.otherCommunitiesSuccess;
  bool get isOtherCommunitiesFailure =>
      this == CommunityStatus.otherCommunitiesFailure;
}

@freezed
class CommunityState with _$CommunityState {
  const factory CommunityState(
      {@Default(CommunityStatus.init) CommunityStatus communityStatus,
      MyCommunitiesResponse? myCommunities,
      OtherCommunitiesResponse? otherCommunities,
      CommunityDetailsResponse? details,
      String? errorMessage}) = _CommunityState;
}
