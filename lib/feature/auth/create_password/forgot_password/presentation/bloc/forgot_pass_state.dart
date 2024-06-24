part of 'forgot_pass_bloc.dart';



enum ForgotPassStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == ForgotPassStatus.init;

  bool get isLoading => this == ForgotPassStatus.loading;

  bool get isSuccess => this == ForgotPassStatus.success;

  bool get isFailure => this == ForgotPassStatus.failure;
}

@freezed
class ForgotPassState with _$ForgotPassState {
  const factory ForgotPassState({
    @Default(ForgotPassStatus.init) ForgotPassStatus forgotPassStatus,
    ForgotPasswordResponse? forgotPassResponse,
    String? errorMessage,
    String? errorCode,
  })=_ForgotPassState;
}
