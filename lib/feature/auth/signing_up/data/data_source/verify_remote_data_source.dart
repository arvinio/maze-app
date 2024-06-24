import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/resend_response/resend_response.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/verify_response/verify_response.dart';

abstract class VerifyRemoteDataSource {
  Future<ApiResponse<VerifyResponse>> verify(
      {required String userId,
    required String code});

  Future<ApiResponse<ResendResponse>> resend(
      {required String userId});
}