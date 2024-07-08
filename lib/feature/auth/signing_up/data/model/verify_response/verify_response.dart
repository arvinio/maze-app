import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'verify_response.freezed.dart';
part 'verify_response.g.dart';

VerifyResponse verifyResponseFromJson(String str) => VerifyResponse.fromJson(json.decode(str));

String verifyResponseToJson(VerifyResponse data) => json.encode(data.toJson());

@freezed
class VerifyResponse with _$VerifyResponse {
  const factory VerifyResponse({
    @JsonKey(name: "userId")
    String? userId,
    @JsonKey(name: "token")
    String? token,
    @JsonKey(name: "refreshToken")
    String? refreshToken,
    @JsonKey(name: "message")
    String? message,
  }) = _VerifyResponse;

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => _$VerifyResponseFromJson(json);
}
