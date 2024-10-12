import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bin_list_response.freezed.dart';
part 'bin_list_response.g.dart';

BinListResponse binListResponseFromJson(String str) => BinListResponse.fromJson(json.decode(str));

String binListResponseToJson(BinListResponse data) => json.encode(data.toJson());

@freezed
class BinListResponse with _$BinListResponse {
  const factory BinListResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<BinModel>? result,
  }) = _BinListResponse;

  factory BinListResponse.fromJson(Map<String, dynamic> json) => _$BinListResponseFromJson(json);
}

@freezed
class BinModel with _$BinModel {
  const factory BinModel({
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
    String? photo,
    @JsonKey(name: "chartData")
    List<ChartDataModel>? chartData,
    @JsonKey(name: "totalAmount")
    int? totalAmount,
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
    @JsonKey(name: "lastEntry")
    DateTime? lastEntry,
  }) = _BinModel;

  factory BinModel.fromJson(Map<String, dynamic> json) => _$BinModelFromJson(json);
}

@freezed
class ChartDataModel with _$ChartDataModel {
  const factory ChartDataModel({
    @JsonKey(name: "name")
    DateTime? name,
    @JsonKey(name: "value")
    int? value,
  }) = _ChartDataModel;

  factory ChartDataModel.fromJson(Map<String, dynamic> json) => _$ChartDataModelFromJson(json);
}

@freezed
class TypeOfCompostBin with _$TypeOfCompostBin {
  const factory TypeOfCompostBin({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "name")
    String? name,
  }) = _TypeOfCompostBin;

  factory TypeOfCompostBin.fromJson(Map<String, dynamic> json) => _$TypeOfCompostBinFromJson(json);
}
