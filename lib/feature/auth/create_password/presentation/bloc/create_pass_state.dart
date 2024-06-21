part of 'create_pass_bloc.dart';

enum CreatePassStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == CreatePassStatus.init;

  bool get isLoading => this == CreatePassStatus.loading;

  bool get isSuccess => this == CreatePassStatus.success;

  bool get isFailure => this == CreatePassStatus.failure;
}

@freezed
class CreatePassState with _$CreatePassState {
  const factory CreatePassState({
    @Default(CreatePassStatus.init) CreatePassStatus createPassStatus,
    CreatePasswordResponse? createPassResponse,
  })=_CreatePassState;
}
