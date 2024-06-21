import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'refresh_token_response.freezed.dart';
part 'refresh_token_response.g.dart';

RefreshTokenResponse refreshTokenResponseFromJson(String str) => RefreshTokenResponse.fromJson(json.decode(str));

String refreshTokenResponseToJson(RefreshTokenResponse data) => json.encode(data.toJson());

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "token")
    String? token,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);
}
