part of 'login_bloc.dart';

enum LoginStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == LoginStatus.init;

  bool get isLoading => this == LoginStatus.loading;

  bool get isSuccess => this == LoginStatus.success;

  bool get isFailure => this == LoginStatus.failure;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStatus.init) LoginStatus loginStatus,
    LoginResponse? loginResponse,
    String? errorMessage,
    String? errorCode,
  })=_LoginState;
}
