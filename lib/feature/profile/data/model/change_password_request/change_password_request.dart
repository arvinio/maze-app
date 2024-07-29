import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request.freezed.dart';


@freezed
class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    @JsonKey(name: "currentPassword")
    String? currentPassword,
    @JsonKey(name: "password")
    String? password,
  }) = _ChangePasswordRequest;

}
