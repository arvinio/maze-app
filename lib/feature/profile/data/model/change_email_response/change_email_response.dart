import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'change_email_response.freezed.dart';
part 'change_email_response.g.dart';

ChangeEmailResponse changeEmailResponseFromJson(String str) => ChangeEmailResponse.fromJson(json.decode(str));

String changeEmailResponseToJson(ChangeEmailResponse data) => json.encode(data.toJson());

@freezed
class ChangeEmailResponse with _$ChangeEmailResponse {
  const factory ChangeEmailResponse({
    @JsonKey(name: "userId")
    String? userId,
    @JsonKey(name: "success")
    bool? success,
  }) = _ChangeEmailResponse;

  factory ChangeEmailResponse.fromJson(Map<String, dynamic> json) => _$ChangeEmailResponseFromJson(json);
}
