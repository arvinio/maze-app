import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_bin_entry_list_resp.freezed.dart';
part 'get_bin_entry_list_resp.g.dart';

@freezed
abstract class GetBinEntryListResponse with _$GetBinEntryListResponse {
  const factory GetBinEntryListResponse({
    required bool success,
    required List<ApiResponseEntry> result,
  }) = _GetBinEntryListResponse;

  factory GetBinEntryListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBinEntryListResponseFromJson(json);
}

@freezed
abstract class ApiResponseEntry with _$ApiResponseEntry {
  const factory ApiResponseEntry({
    @JsonKey(name: '_id') required String id,
    required ApiBin bin,
    required DateTime entryDate,
    required String type,
    required String? howFull,
    required int? amount,
    String? note,
    List<String>? whatRecycle,
    List<String>? whatDidAdd,
    required bool? isMixed,
    List<String>? compostUsed,
    List<String>? photos,
    required DateTime createdDate,
  }) = _ApiResponseEntry;

  factory ApiResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseEntryFromJson(json);
}

@freezed
abstract class ApiBin with _$ApiBin {
  const factory ApiBin({
    @JsonKey(name: '_id') required String id,
    required String type,
    String? nickname,
    required String pickupDate,
    required String sizeType,
    required int amountOfLitres,
    int? width,
    int? height,
    int? length,
    String? typeOfCompostBin,
    required bool is2Compostement,
    required bool isShare,
    required DateTime createdDate,
  }) = _ApiBin;

  factory ApiBin.fromJson(Map<String, dynamic> json) => _$ApiBinFromJson(json);
}
