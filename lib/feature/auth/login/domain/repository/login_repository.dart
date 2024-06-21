import 'package:maze_app/core/network/model/api_response.dart';

abstract class LoginRepository{
  Future<ApiResponse> login({
    required String email,
    required String password
  });
}
