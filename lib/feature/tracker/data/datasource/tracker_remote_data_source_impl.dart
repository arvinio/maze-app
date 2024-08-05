import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_empty_model.dart';
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source.dart';
import 'package:maze_app/feature/tracker/data/model/get_bins_list_resp.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';

@Injectable(as: TrackerRemoteDataSource)
class TrackerRemoteDataSourceImpl implements TrackerRemoteDataSource {
  final DioCaller dioCaller;

  TrackerRemoteDataSourceImpl({
    @Named(DiConst.dioNamedToken) required this.dioCaller,
  });
  @override
  Future<ApiResponse> createBin(Bin bin) async {
    final data = FormData.fromMap({
      'photo': [
        await MultipartFile.fromFile(bin.imageUrl ?? '',
            filename: '1401-t-Copy.jpg')
      ],
      'type': bin.type.name,
      'nickname': bin.nickName,
      'sizeType': bin.sizeType.name,
      'amountOfLitres': bin.amountOfLiters ?? 0,
      'isShare': bin.isShare,
      'pickupDate': 'every seconds, monthly',
      'typeOfCompostBin': bin.typeOfCompostBin ?? 'compost thumbler',
      'is2Compostement': bin.is2Compostement ?? 'false',
      'width': bin.width ?? '23',
      'height': bin.height ?? '3',
      'length': bin.length ?? '33'
    });
    return await dioCaller.post('api/bin',
        fromJson: RespEmptyModel.fromJson, data: data);
  }

  @override
  Future<ApiResponse<GetBinsListResp>> getBinsList() async {
    return await dioCaller.get('api/bin', fromJson: GetBinsListResp.fromJson);
  }
}
