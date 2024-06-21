part of 'verify_bloc.dart';


enum VerifyStatus {
  init,
  loading,
  success,
  resendSuccess,
  failure;

  bool get isInit => this == VerifyStatus.init;

  bool get isLoading => this == VerifyStatus.loading;

  bool get isSuccess => this == VerifyStatus.success;
  bool get isResendSuccess => this == VerifyStatus.resendSuccess;

  bool get isFailure => this == VerifyStatus.failure;
}

@freezed
class VerifyState with _$VerifyState {
  const factory VerifyState({
    @Default(VerifyStatus.init) VerifyStatus verifyStatus,
    VerifyResponse? verifyResponse,
    ResendResponse? resendResponse
})=_VerifyState;
}
