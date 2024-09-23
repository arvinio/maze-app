part of 'create_community_bloc.dart';

enum CreateCommunityStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == CreateCommunityStatus.init;
  bool get isLoading => this == CreateCommunityStatus.loading;
  bool get isSuccess => this == CreateCommunityStatus.success;
  bool get isFailure=> this == CreateCommunityStatus.failure;
}


@freezed
class  CreateCommunityState with _$CreateCommunityState {
  const factory CreateCommunityState({
    @Default(CreateCommunityStatus.init) CreateCommunityStatus  createStatus,
    CreateCommunityResponse? createResponse,
    String? errorMessage

  })=_CreateCommunityState;
}