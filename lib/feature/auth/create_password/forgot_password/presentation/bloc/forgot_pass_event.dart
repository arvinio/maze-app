part of 'forgot_pass_bloc.dart';

@freezed
class ForgotPassEvent with _$ForgotPassEvent {
  const factory ForgotPassEvent.init() = _Init;
  const factory ForgotPassEvent.forgotPass({
    required String email,
  }) = _forgotPass;
}
