part of 'signup_bloc.dart';

enum SignupStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == SignupStatus.init;

  bool get isLoading => this == SignupStatus.loading;

  bool get isSuccess => this == SignupStatus.success;

  bool get isFailure => this == SignupStatus.failure;
}


@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(SignupStatus.init) SignupStatus signupStatus,
    SignupResponse? signupResponse,
    String? errorMessage,
    String? errorCode

  })=_SignupState;
}