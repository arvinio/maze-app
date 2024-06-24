import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response.freezed.dart';
part 'signup_response.g.dart';

SignupResponse SignupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String SignupResponseToJson(SignupResponse data) => json.encode(data.toJson());


@freezed
class SignupResponse with _$SignupResponse{
  const factory SignupResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: "message")
    String? message,
  }) = _SignupResponse;

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
