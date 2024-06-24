import 'package:maze_app/core/network/model/api_response.dart';

abstract class VerifyRepository{
  Future<ApiResponse> verify({
    required String userId,
    required String code
});

  Future<ApiResponse> resend({
    required String userId,
  });
}