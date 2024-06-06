
import 'package:maze_app/core/network/model/api_response.dart';

abstract class VersioningRemoteDataSource{
  Future<ApiResponse> getVersion();
}