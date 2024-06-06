import 'package:maze_app/core/network/model/api_response.dart';

abstract class VersioningRepository {
  Future<ApiResponse> getVersion();
}
