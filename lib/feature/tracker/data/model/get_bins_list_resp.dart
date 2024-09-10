import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_app/core/util/typedef.dart';

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
class GetBinResp with _$GetBinResp {
  factory GetBinResp({
    required bool success,
    required BinModel result,
  }) = _GetBinResp;

  factory GetBinResp.fromJson(Map<String, dynamic> json) =>
      _$GetBinRespFromJson(json);
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
    List<ChartDataModel>? chartData,
    int? totalAmount,
  }) = _BinModel;

  factory BinModel.fromJson(DataMap json) => _$BinModelFromJson(json);
}

@freezed
class ChartDataModel with _$ChartDataModel {
  factory ChartDataModel({
    required String name,
    required int value,
  }) = _ChartDataModel;

  factory ChartDataModel.fromJson(DataMap json) =>
      _$ChartDataModelFromJson(json);
}
