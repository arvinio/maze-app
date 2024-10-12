import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bin_entry_list_response.freezed.dart';
part 'bin_entry_list_response.g.dart';

BinEntryListResponse binEntryListResponseFromJson(String str) => BinEntryListResponse.fromJson(json.decode(str));

String binEntryListResponseToJson(BinEntryListResponse data) => json.encode(data.toJson());

@freezed
class BinEntryListResponse with _$BinEntryListResponse {
  const factory BinEntryListResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<ApiResponseEntry>? result,
  }) = _BinEntryListResponse;

  factory BinEntryListResponse.fromJson(Map<String, dynamic> json) => _$BinEntryListResponseFromJson(json);
}

@freezed
class ApiResponseEntry with _$ApiResponseEntry {
  const factory ApiResponseEntry({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "bin")
    ApiBin? bin,
    @JsonKey(name: "entryDate")
    DateTime? entryDate,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "howFull")
    String? howFull,
    @JsonKey(name: "amount")
    int? amount,
    @JsonKey(name: "whatRecycle")
    List<String>? whatRecycle,
    @JsonKey(name: "whatDidAdd")
    List<String>? whatDidAdd,
    @JsonKey(name: "compostUsed")
    List<String>? compostUsed,
    @JsonKey(name: "photos")
    List<String>? photos,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
    @JsonKey(name: "note")
    String? note,
    @JsonKey(name: "isMixed")
    bool? isMixed,
  }) = _ApiResponseEntry;

  factory ApiResponseEntry.fromJson(Map<String, dynamic> json) => _$ApiResponseEntryFromJson(json);
}

@freezed
class ApiBin with _$ApiBin {
  const factory ApiBin({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "nickname")
    String? nickname,
    @JsonKey(name: "pickupDate")
    String? pickupDate,
    @JsonKey(name: "sizeType")
    String? sizeType,
    @JsonKey(name: "amountOfLitres")
    int? amountOfLitres,
    @JsonKey(name: "width")
    int? width,
    @JsonKey(name: "height")
    int? height,
    @JsonKey(name: "length")
    int? length,
    @JsonKey(name: "typeOfCompostBin")
    String? typeOfCompostBin,
    @JsonKey(name: "is2Compostement")
    bool? is2Compostement,
    @JsonKey(name: "isShare")
    bool? isShare,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
  }) = _ApiBin;

  factory ApiBin.fromJson(Map<String, dynamic> json) => _$ApiBinFromJson(json);
}
