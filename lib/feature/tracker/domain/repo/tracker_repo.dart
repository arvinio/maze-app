import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';

abstract interface class TrackerRepo {
  Future<ApiResponse<List<Bin>>> getBinsList();
  Future<ApiResponse> createBin({required Bin bin});
}
