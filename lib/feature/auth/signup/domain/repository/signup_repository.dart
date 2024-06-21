
import 'package:maze_app/core/network/model/api_response.dart';

abstract class SignupRepository {
  Future<ApiResponse> signUp({ required String email});

}
