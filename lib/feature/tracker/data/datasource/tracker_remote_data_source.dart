import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/model/get_bin_entry_list_resp.dart';
import 'package:maze_app/feature/tracker/data/model/get_bins_list_resp.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

abstract interface class TrackerRemoteDataSource {
  Future<ApiResponse<GetBinsListResp>> getBinsList();
  Future<ApiResponse> createBin(Bin bin);
  Future<ApiResponse> editbin(Bin bin);
  Future<ApiResponse> deleteBin(String binId);
  Future<ApiResponse> getBinChartData(String binId);

  ///
  Future<ApiResponse> createBinEntry(Entry entry);
  Future<ApiResponse> editBinEntry(EditEntry entry);
  Future<ApiResponse> deleteBinEntry(String entryId);
  Future<ApiResponse<GetBinEntryListResponse>> getBinEntryList(String binId);
  Future<ApiResponse> deletebinEntryPhoto(String binEntryId, String photo);
}
