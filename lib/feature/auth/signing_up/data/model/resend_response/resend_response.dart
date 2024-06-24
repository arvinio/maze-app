
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'resend_response.freezed.dart';
part 'resend_response.g.dart';

ResendResponse resendResponseFromJson(String str) => ResendResponse.fromJson(json.decode(str));

String resendResponseToJson(ResendResponse data) => json.encode(data.toJson());

@freezed
class ResendResponse with _$ResendResponse {
  const factory ResendResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "userId")
    String? userId,
    @JsonKey(name: "code")
    String? code,
  }) = _ResendResponse;

  factory ResendResponse.fromJson(Map<String, dynamic> json) => _$ResendResponseFromJson(json);
}
