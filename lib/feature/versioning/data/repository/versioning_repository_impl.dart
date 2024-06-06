import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/versioning/data/data_source/versioning_remote_data_source.dart';
import 'package:maze_app/feature/versioning/domain/repository/versioning_repository.dart';

@Injectable(as: VersioningRepository)
class VersioningRepositoryImpl implements VersioningRepository {
  final VersioningRemoteDataSource versioningRemoteDataSource;

  VersioningRepositoryImpl(this.versioningRemoteDataSource);

  @override
  Future<ApiResponse> getVersion() async{
    return await versioningRemoteDataSource.getVersion();
  }
}
