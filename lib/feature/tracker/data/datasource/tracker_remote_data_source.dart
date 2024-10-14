import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/model/bin_entry_list/bin_entry_list_response.dart';
import 'package:maze_app/feature/tracker/data/model/bin_list/bin_list_response.dart';
import 'package:maze_app/feature/tracker/data/model/bin_response/bin_response.dart';
import 'package:maze_app/feature/tracker/data/model/enum/create_bin_types.dart';
import 'package:maze_app/feature/tracker/data/model/get_bin_chart_data_resp.dart';
import 'package:maze_app/feature/tracker/data/model/success_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

abstract interface class TrackerRemoteDataSource {
  Future<ApiResponse<BinListResponse>> getBinsList();
  Future<ApiResponse> createBin(Bin bin,CreateBinTypes binType);
  Future<ApiResponse> editBin(Bin bin);
  Future<ApiResponse> deleteBin(String binId);
  Future<ApiResponse> deleteBinPermanently(String binId);
  Future<ApiResponse> restoreDeletedBin(String binId);
  Future<ApiResponse> getDeletedBins();
  Future<ApiResponse<GetBinChartDataResp>> getBinChartData(String binId);
  Future<ApiResponse<BinResponse>> getBinDetails(String binId);
  Future<ApiResponse<SuccessResponse>> transferBinData(String sourceBinId,String targetBinId);
  Future<ApiResponse> getListOfCompostBinTypes();

  ///
  Future<ApiResponse> createBinEntry(Entry entry);
  Future<ApiResponse> editBinEntry(EditEntry entry);
  Future<ApiResponse> deleteBinEntry(String entryId);
  Future<ApiResponse<BinEntryListResponse>> getBinEntryList(String binId);
  Future<ApiResponse> deletebinEntryPhoto(String binEntryId, String photo);
}
