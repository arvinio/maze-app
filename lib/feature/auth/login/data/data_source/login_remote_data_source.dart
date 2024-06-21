import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/login/data/model/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResponse<LoginResponse>> login(
      {required String email,
        required String password});


}
