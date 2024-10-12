part of 'edit_community_bloc.dart';

enum EditCommunityStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == EditCommunityStatus.init;
  bool get isLoading => this == EditCommunityStatus.loading;
  bool get isSuccess => this == EditCommunityStatus.success;
  bool get isFailure=> this == EditCommunityStatus.failure;
}


@freezed
class  EditCommunityState with _$EditCommunityState {
  const factory EditCommunityState({
    @Default(EditCommunityStatus.init) EditCommunityStatus  editStatus,
    CreateCommunityResponse? editResponse,
    String? errorMessage

  })=_EditCommunityState;
}