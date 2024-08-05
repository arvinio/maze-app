import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/model/get_bins_list_resp.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';

abstract interface class TrackerRemoteDataSource {
  Future<ApiResponse<GetBinsListResp>> getBinsList();
  Future<ApiResponse> createBin(Bin bin);
}
