
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/signup/data/model/signup_response.dart';

abstract class SignupRemoteDataSource{
  Future<ApiResponse<SignupResponse>> signUp({ required String email});
}