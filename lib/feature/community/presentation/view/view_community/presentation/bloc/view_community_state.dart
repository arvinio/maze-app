part of 'view_community_bloc.dart';

enum ViewCommunityStatus {
  init,
  loading,
  success,
  failure,
  joinCommunityLoading,
  joinCommunitySuccess,
  joinCommunityFailure,
  deleteCommunityLoading,
  deleteCommunitySuccess;

  bool get isInit => this == ViewCommunityStatus.init;
  bool get isLoading => this == ViewCommunityStatus.loading;
  bool get isSuccess => this == ViewCommunityStatus.success;
  bool get isFailure=> this == ViewCommunityStatus.failure;
  bool get isJoinCommunityLoading => this ==  ViewCommunityStatus.joinCommunityLoading;
  bool get isJoinCommunitySuccess => this ==  ViewCommunityStatus.joinCommunitySuccess;
  bool get isJoinCommunityFailure => this ==  ViewCommunityStatus.joinCommunityFailure;
  bool get isDeleteCommunityLoading => this ==  ViewCommunityStatus.deleteCommunityLoading;
  bool get isDeleteCommunitySuccess => this ==  ViewCommunityStatus.deleteCommunitySuccess;
}


@freezed
class ViewCommunityState with _$ViewCommunityState {
  const factory ViewCommunityState({
    @Default(ViewCommunityStatus.init) ViewCommunityStatus viewCommunityStatus,
    String? errorMessage

  })=_ViewCommunityState;
}