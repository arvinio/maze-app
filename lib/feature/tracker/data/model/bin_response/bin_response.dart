import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:maze_app/feature/tracker/data/model/bin_list/bin_list_response.dart';

part 'bin_response.freezed.dart';
part 'bin_response.g.dart';

BinResponse binResponseFromJson(String str) => BinResponse.fromJson(json.decode(str));

String binResponseToJson(BinResponse data) => json.encode(data.toJson());

@freezed
class BinResponse with _$BinResponse {
  const factory BinResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    BinDetails? result,
  }) = _BinResponse;

  factory BinResponse.fromJson(Map<String, dynamic> json) => _$BinResponseFromJson(json);
}

@freezed
class BinDetails with _$BinDetails {
  const factory BinDetails({
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
    @JsonKey(name: "isShare")
    bool? isShare,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
    @JsonKey(name: "photo")
    dynamic photo,
    @JsonKey(name: "width")
    int? width,
    @JsonKey(name: "height")
    int? height,
    @JsonKey(name: "length")
    int? length,
    @JsonKey(name: "typeOfCompostBin")
    TypeOfCompostBin? typeOfCompostBin,
    @JsonKey(name: "is2Compostement")
    bool? is2Compostement,
  }) = _BinDetails;

  factory BinDetails.fromJson(Map<String, dynamic> json) => _$BinDetailsFromJson(json);
}
