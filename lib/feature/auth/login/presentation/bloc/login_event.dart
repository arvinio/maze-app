part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.init() = _Init;
  const factory LoginEvent.loginUser({
    required String email,
    required String password,
  }) = _LoginUser;
}
