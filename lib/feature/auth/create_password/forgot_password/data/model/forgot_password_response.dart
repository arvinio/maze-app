import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'forgot_password_response.freezed.dart';
part 'forgot_password_response.g.dart';

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));

String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({
    @JsonKey(name: "userId")
    String? userId,
    @JsonKey(name: "message")
    String? message,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);
}
