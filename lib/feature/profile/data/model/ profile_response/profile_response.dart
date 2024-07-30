import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "username")
    String? username,
    @JsonKey(name: "role")
    String? role,
    @JsonKey(name: "measurementSystem")
    String? measurementSystem,
    @JsonKey(name: "birthDate")
    DateTime? birthDate,
    @JsonKey(name: "firstName")
    String? firstName,
    @JsonKey(name: "householdSize")
    int? householdSize,
    @JsonKey(name: "lastName")
    String? lastName,
    @JsonKey(name: "notification")
    bool? notification,
    @JsonKey(name: "council")
    HouseholdInfo? council,
    @JsonKey(name: "country")
    HouseholdInfo? country,
    @JsonKey(name: "postcode")
    String? postcode,
    @JsonKey(name: "state")
    HouseholdInfo? state,
    @JsonKey(name: "about")
    String? about,
    @JsonKey(name: "avatar")
    String? avatar,
    @JsonKey(name: "cover")
    String? cover,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
}

@freezed
class HouseholdInfo with _$HouseholdInfo {
  const factory HouseholdInfo({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "name")
    String? name,
  }) = _HouseholdInfo;

  factory HouseholdInfo.fromJson(Map<String, dynamic> json) => _$HouseholdInfoFromJson(json);
}
