import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

SuccessResponse successResponseFromJson(String str) => SuccessResponse.fromJson(json.decode(str));

String successResponseToJson(SuccessResponse data) => json.encode(data.toJson());

@freezed
class SuccessResponse with _$SuccessResponse {
  const factory SuccessResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);
}
