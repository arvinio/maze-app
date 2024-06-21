part of 'verify_bloc.dart';

@freezed
class VerifyEvent with _$VerifyEvent {
  const factory VerifyEvent.init() = _Init;
  const factory VerifyEvent.verifyCode({
    required String userId,
    required String code
}) = _VeifyCode;
  const factory VerifyEvent.resend({
    required String userId,
  }) = _Resend;
}
