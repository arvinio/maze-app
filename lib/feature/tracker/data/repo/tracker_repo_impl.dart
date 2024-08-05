import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repo.dart';

@Injectable(as: TrackerRepo)
class TrackerRepoImpl implements TrackerRepo {
  final TrackerRemoteDataSource _trackerRemoteDataSource;

  TrackerRepoImpl({required TrackerRemoteDataSource trackerRemoteDataSource})
      : _trackerRemoteDataSource = trackerRemoteDataSource;
  @override
  Future<ApiResponse<List<Bin>>> getBinsList() async {
    final resp = await _trackerRemoteDataSource.getBinsList();
    return resp.when(
      completed: (data, statusCode) {
        var bins = <Bin>[];
        data.result.map(
          (e) {
            var type = BinType.values.firstWhere(
              (element) {
                return element.name == e.type;
              },
            );
            var sizeT = SizeType.values.firstWhere(
              (element) {
                return element.name == e.sizeType;
              },
            );
            bins.add(
              Bin(
                  type: type,
                  id: e.id,
                  nickName: e.nickname,
                  sizeType: sizeT,
                  amountOfLiters: e.amountOfLitres,
                  isShare: e.isShare,
                  imageUrl: e.photo,
                  pickUpDate: e.pickupDate,
                  typeOfCompostBin: e.typeOfCompostBin,
                  is2Compostement: e.is2Compostement,
                  width: e.width.toString(),
                  length: e.length.toString(),
                  height: e.height.toString()),
            );
          },
        );
        return ApiResponse.completed(data: bins);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse> createBin({required Bin bin}) async {
    final resp = await _trackerRemoteDataSource.createBin(bin);
    return resp;
  }
}
