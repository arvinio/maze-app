import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_request.freezed.dart';


@freezed
class EditProfileRequest with _$EditProfileRequest {
  const factory EditProfileRequest({
    @JsonKey(name: "cover") File? cover,
    @JsonKey(name: "avatar") File? avatar,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "about") String? about,
  }) = _EditProfileRequest;

}
