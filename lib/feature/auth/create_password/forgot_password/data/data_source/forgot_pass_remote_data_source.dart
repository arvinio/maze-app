import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/data/model/forgot_password_response.dart';

abstract class ForgotPassRemoteDataSource{
  Future<ApiResponse<ForgotPasswordResponse>> forgotPassword({ required String email});
}