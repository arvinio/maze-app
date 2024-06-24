import 'package:maze_app/core/network/model/api_response.dart';

abstract class TokenRepository{
  Future<ApiResponse> generateNewToken({required String refreshToken});
}