part of 'signup_bloc.dart';

@freezed
class SignupEvent with _$SignupEvent {

  const factory SignupEvent.init({
    required String userName,
  }) = _InitEvent;

}
