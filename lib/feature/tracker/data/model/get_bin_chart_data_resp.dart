import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_bin_chart_data_resp.freezed.dart';
part 'get_bin_chart_data_resp.g.dart';

@freezed
class GetBinChartDataResp with _$GetBinChartDataResp {
  const factory GetBinChartDataResp({
    required bool success,
    required Result result,
  }) = _GetBinChartDataResp;

  factory GetBinChartDataResp.fromJson(Map<String, dynamic> json) =>
      _$GetBinChartDataRespFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    required String nickname,
    required String type,
    required String sizeType,
    required int amountOfLitres,
    required int width,
    required int height,
    required int length,
    required int totalAmount,
    required List<ChartEntry> chartWeek,
    required List<ChartEntry> chartMonth,
    required List<ChartEntry> chartYear,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class ChartEntry with _$ChartEntry {
  const factory ChartEntry({
    required String name,
    required int value,
  }) = _ChartEntry;

  factory ChartEntry.fromJson(Map<String, dynamic> json) =>
      _$ChartEntryFromJson(json);
}
