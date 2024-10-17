import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_household_request.freezed.dart';


@freezed
class EditHouseholdRequest with _$EditHouseholdRequest {
  const factory EditHouseholdRequest({
    @JsonKey(name: "country")
    String? country,
    @JsonKey(name: "state")
    String? state,
    @JsonKey(name: "council")
    String? council,
    @JsonKey(name: "postcode")
    String? postcode,
    @JsonKey(name: "householdSize")
    int? householdSize,
    @JsonKey(name: "measurementSystem")
    String? measurementSystem,
  }) = _EditHouseholdRequest;

}
