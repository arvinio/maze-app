import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/versioning/data/data_source/versioning_remote_data_source.dart';
import 'package:maze_app/feature/versioning/data/model/check_client_version_response.dart';

@Injectable(as: VersioningRemoteDataSource)
class VersioningRemoteDataSourceImpl implements VersioningRemoteDataSource {
  final DioCaller dioCaller;

  VersioningRemoteDataSourceImpl({@Named(DiConst.versioning) required this.dioCaller});

  @override
  Future<ApiResponse> getVersion() async{
    return await dioCaller.get('checkVersion?versionName=1.0.0+2',
        fromJson: CheckClientVersionResponse.fromJson
    );
    }

}