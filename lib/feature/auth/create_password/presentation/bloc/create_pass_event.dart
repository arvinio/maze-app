part of 'create_pass_bloc.dart';

@freezed
class CreatePassEvent with _$CreatePassEvent {
  const factory CreatePassEvent.init() = _Init;
  const factory CreatePassEvent.confirmPassword({
    required String password,
  }) = _ConfirmPassword;
}