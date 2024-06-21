
import 'package:maze_app/core/network/model/api_response.dart';

abstract class CreatePasswordRepository {
  Future<ApiResponse> setPassword({
    required String password,
  });
}
