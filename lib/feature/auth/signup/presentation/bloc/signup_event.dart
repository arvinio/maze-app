part of 'signup_bloc.dart';

@freezed
class SignupEvent with _$SignupEvent {

  const factory SignupEvent.init() = _InitEvent;
  const factory SignupEvent.signup({
    required String userName,
  }) = _SignupEvent;

}
