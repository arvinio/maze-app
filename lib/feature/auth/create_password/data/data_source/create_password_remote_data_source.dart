import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/create_password/data/model/create_password_response.dart';

abstract class CreatePasswordRemoteDataSource {
  Future<ApiResponse<CreatePasswordResponse>> setPassword(
      {required String password});
}
