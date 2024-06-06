import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_client_version_response.freezed.dart';
part 'check_client_version_response.g.dart';

CheckClientVersionResponse checkClientVersionResponseFromJson(String str) =>
    CheckClientVersionResponse.fromJson(json.decode(str));

String checkClientVersionResponseToJson(CheckClientVersionResponse data) => json.encode(data.toJson());


@freezed
class CheckClientVersionResponse with _$CheckClientVersionResponse{
  const factory CheckClientVersionResponse({
    @JsonKey(name: 'updateExist') bool? updateExist,
    @JsonKey(name: 'optional') bool? optional,
  }) = _CheckClientVersionResponse;

  factory CheckClientVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckClientVersionResponseFromJson(json);
}
