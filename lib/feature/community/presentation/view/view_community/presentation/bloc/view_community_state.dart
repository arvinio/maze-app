part of 'view_community_bloc.dart';

enum ViewCommunityStatus {
  init,
  joinCommunityLoading,
  joinCommunitySuccess,
  joinCommunityFailure,
  deleteCommunityLoading,
  deleteCommunitySuccess,
  deleteCommunityFailure;

  bool get isInit => this == ViewCommunityStatus.init;
  bool get isJoinCommunityLoading => this ==  ViewCommunityStatus.joinCommunityLoading;
  bool get isJoinCommunitySuccess => this ==  ViewCommunityStatus.joinCommunitySuccess;
  bool get isJoinCommunityFailure => this ==  ViewCommunityStatus.joinCommunityFailure;
  bool get isDeleteCommunityLoading => this ==  ViewCommunityStatus.deleteCommunityLoading;
  bool get isDeleteCommunitySuccess => this ==  ViewCommunityStatus.deleteCommunitySuccess;
  bool get isDeleteCommunityFailure => this ==  ViewCommunityStatus.deleteCommunityFailure;
}


@freezed
class ViewCommunityState with _$ViewCommunityState {
  const factory ViewCommunityState({
    @Default(ViewCommunityStatus.init) ViewCommunityStatus viewCommunityStatus,
    String? errorMessage

  })=_ViewCommunityState;
}