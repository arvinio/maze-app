part of 'create_post_bloc.dart';


enum CreatePostStatus {
  init,
  loading,
  success,
  notifyChangeFieldsValue,
  failure;

  bool get isInit => this == CreatePostStatus.init;
  bool get isLoading => this == CreatePostStatus.loading;
  bool get isSuccess => this == CreatePostStatus.success;
  bool get isNotifyChangeFieldsValue=> this == CreatePostStatus.notifyChangeFieldsValue;
  bool get isFailure=> this == CreatePostStatus.failure;
}


@freezed
class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    @Default(CreatePostStatus.init) CreatePostStatus createStatus,
    CreatePostResponse? createResponse,
    CommunityDetails? selectedCommunity,
    String? errorMessage

  })=_CreatePostState;
}