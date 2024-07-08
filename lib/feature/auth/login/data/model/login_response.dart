import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: "userId")
    String? userId,
    @JsonKey(name: "role")
    String? role,
    @JsonKey(name: "token")
    String? token,
    @JsonKey(name: "refreshToken")
    String? refreshToken,
    @JsonKey(name: "message")
    String? message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
