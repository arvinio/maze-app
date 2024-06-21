
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_password_response.freezed.dart';
part 'create_password_response.g.dart';

CreatePasswordResponse createPasswordResponseFromJson(String str) => CreatePasswordResponse.fromJson(json.decode(str));

String createPasswordResponseToJson(CreatePasswordResponse data) => json.encode(data.toJson());

@freezed
class CreatePasswordResponse with _$CreatePasswordResponse {
  const factory CreatePasswordResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _CreatePasswordResponse;

  factory CreatePasswordResponse.fromJson(Map<String, dynamic> json) => _$CreatePasswordResponseFromJson(json);
}
