import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_details_request.freezed.dart';

@freezed
class EditDetailsRequest with _$EditDetailsRequest {
  const factory EditDetailsRequest({
    @JsonKey(name: "firstName")
    String? firstName,
    @JsonKey(name: "lastName")
    String? lastName,
    @JsonKey(name: "birthDate")
    String? birthDate,
  }) = _EditDetailsRequest;

}
