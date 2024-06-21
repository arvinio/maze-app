
import 'package:maze_app/core/network/model/api_response.dart';

abstract class ForgotPassRepository {
  Future<ApiResponse> forgotPassword({ required String email});

}
