import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'edit_profile_response.freezed.dart';
part 'edit_profile_response.g.dart';

EditProfileResponse editProfileResponseFromJson(String str) => EditProfileResponse.fromJson(json.decode(str));

String editProfileResponseToJson(EditProfileResponse data) => json.encode(data.toJson());

@freezed
class EditProfileResponse with _$EditProfileResponse {
  const factory EditProfileResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _EditProfileResponse;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);
}
