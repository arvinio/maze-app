
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'register_details_response.freezed.dart';
part 'register_details_response.g.dart';

RegisterDetailsResponse registerDetailsResponseFromJson(String str) => RegisterDetailsResponse.fromJson(json.decode(str));

String registerDetailsResponseToJson(RegisterDetailsResponse data) => json.encode(data.toJson());

@freezed
class RegisterDetailsResponse with _$RegisterDetailsResponse {
  const factory RegisterDetailsResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _RegisterDetailsResponse;

  factory RegisterDetailsResponse.fromJson(Map<String, dynamic> json) => _$RegisterDetailsResponseFromJson(json);
}
