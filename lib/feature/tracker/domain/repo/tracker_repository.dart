import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/model/success_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';

abstract interface class TrackerRepository {
  Future<ApiResponse<List<Bin>>> getBinsList();
  Future<ApiResponse> createBin({required Bin bin});
  Future<ApiResponse> editBin({required Bin bin});
  Future<ApiResponse> deleteBin({required String binId});
  Future<ApiResponse> deleteBinPermanently({required String binId});
  Future<ApiResponse> restoreDeletedBin({required String binId});
  Future<ApiResponse> getDeletedBins();
  Future<ApiResponse> createBinEntry({required Entry entry});
  Future<ApiResponse> editBinEntry({required EditEntry entry});
  Future<ApiResponse> deleteBinEntry({required String entryId});
  Future<ApiResponse<List<EditEntry>>> getBinEntryList({required String binId});
  Future<ApiResponse<Bin>> getBinDetails({required String binId});
  Future<ApiResponse<BinChartData>> getBinChartData({required String binId});
  Future<ApiResponse<List<EditEntry>>> sortBinEntries({
    required String binId,
    required EntrySortOption sortOption,
  });
  Future<ApiResponse<SuccessResponse>> transferBinData(String sourceBinId,String targetBinId);


}
