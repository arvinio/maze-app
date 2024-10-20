// To parse this JSON data, do
//
//     final chartDataResponse = chartDataResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chart_data_response.freezed.dart';
part 'chart_data_response.g.dart';

ChartDataResponse chartDataResponseFromJson(String str) => ChartDataResponse.fromJson(json.decode(str));

String chartDataResponseToJson(ChartDataResponse data) => json.encode(data.toJson());

@freezed
class ChartDataResponse with _$ChartDataResponse {
  const factory ChartDataResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    ChartData? chartDataResult,
  }) = _ChartDataResponse;

  factory ChartDataResponse.fromJson(Map<String, dynamic> json) => _$ChartDataResponseFromJson(json);
}

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    @JsonKey(name: "nickname")
    String? nickname,
    @JsonKey(name: "type")
    String? type,
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
    @JsonKey(name: "totalAmount")
    int? totalAmount,
    @JsonKey(name: "chartWeek")
    List<ChartEntry>? chartWeek,
    @JsonKey(name: "chartMonth")
    List<ChartEntry>? chartMonth,
    @JsonKey(name: "chartYear")
    List<ChartEntry>? chartYear,
  }) = _ChartData;

  factory ChartData.fromJson(Map<String, dynamic> json) => _$ChartDataFromJson(json);
}

@freezed
class ChartEntry with _$ChartEntry {
  const factory ChartEntry({
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "value")
    int? value,
  }) = _ChartEntry;

  factory ChartEntry.fromJson(Map<String, dynamic> json) => _$ChartEntryFromJson(json);
}
