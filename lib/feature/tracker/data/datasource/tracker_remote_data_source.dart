import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/model/get_bin_chart_data_resp.dart';
import 'package:maze_app/feature/tracker/data/model/get_bin_entry_list_resp.dart';
import 'package:maze_app/feature/tracker/data/model/get_bins_list_resp.dart';
import 'package:maze_app/feature/tracker/data/model/success_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

abstract interface class TrackerRemoteDataSource {
  Future<ApiResponse<GetBinsListResp>> getBinsList();
  Future<ApiResponse> createBin(Bin bin);
  Future<ApiResponse> editBin(Bin bin);
  Future<ApiResponse> deleteBin(String binId);
  Future<ApiResponse> deleteBinPermanently(String binId);
  Future<ApiResponse> restoreDeletedBin(String binId);
  Future<ApiResponse> getDeletedBins();
  Future<ApiResponse<GetBinChartDataResp>> getBinChartData(String binId);
  Future<ApiResponse<GetBinResp>> getBinDetails(String binId);
  Future<ApiResponse<SuccessResponse>> transferBinData(String sourceBinId,String targetBinId);

  ///
  Future<ApiResponse> createBinEntry(Entry entry);
  Future<ApiResponse> editBinEntry(EditEntry entry);
  Future<ApiResponse> deleteBinEntry(String entryId);
  Future<ApiResponse<GetBinEntryListResponse>> getBinEntryList(String binId);
  Future<ApiResponse> deletebinEntryPhoto(String binEntryId, String photo);
}
