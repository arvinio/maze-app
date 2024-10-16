part of 'community_profile_bloc.dart';


enum CommunityProfileStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == CommunityProfileStatus.init;
  bool get isLoading => this == CommunityProfileStatus.loading;
  bool get isSuccess => this == CommunityProfileStatus.success;
  bool get isFailure => this == CommunityProfileStatus.failure;
}

@freezed
class CommunityProfileState with _$CommunityProfileState {
  const factory CommunityProfileState({
    @Default(CommunityProfileStatus.init) CommunityProfileStatus status,
    int? wasteSaved,
    int? compostSaved,
    int? wasteRecycled,
    String? errorMessage
  }) = _CommunityProfileState ;
}
