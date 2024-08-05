import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_bins_list_resp.freezed.dart';
part 'get_bins_list_resp.g.dart';

@freezed
class GetBinsListResp with _$GetBinsListResp {
  factory GetBinsListResp({
    required bool success,
    required List<BinModel> result,
  }) = _GetBinsListResp;

  factory GetBinsListResp.fromJson(Map<String, dynamic> json) =>
      _$GetBinsListRespFromJson(json);
}

@freezed
class BinModel with _$BinModel {
  factory BinModel({
    @JsonKey(name: "_id") required String id,
    required String type,
    required String nickname,
    required String pickupDate,
    required String sizeType,
    required int amountOfLitres,
    required int width,
    required int height,
    required int length,
    required String typeOfCompostBin,
    required bool is2Compostement,
    required bool isShare,
    required DateTime createdDate,
    @Default(null) String? photo,
    required List<ChartData> chartData,
    required int totalAmount,
  }) = _BinModel;

  factory BinModel.fromJson(Map<String, dynamic> json) =>
      _$BinModelFromJson(json);
}

@freezed
class ChartData with _$ChartData {
  factory ChartData({
    required String name,
    required int value,
  }) = _ChartData;

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);
}
