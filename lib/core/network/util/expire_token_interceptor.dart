import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/util/crypto/encrypt_helper.dart';
import 'package:maze_app/data_provider/refresh_token/token_manager.dart';
import 'package:maze_app/di/injection_container.dart';

import '../model/api_error.dart';

@lazySingleton
class ExpireTokenInterceptor implements Interceptor {
  ExpireTokenInterceptor(this.encryptHelper);

  final EncryptHelper encryptHelper;

  @override
  Future<void> onError(
      DioException dioError, ErrorInterceptorHandler handler) async {
    handler.next(dioError);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, String> currentHeader =
        Map<String, String>.from(options.headers);
    TokenManager tokenManager = inject();
    String? validToken = await tokenManager.getToken();
    if (validToken!.isNotEmpty) {
      String token = 'Bearer $validToken';
      currentHeader['Authorization'] = token;

      options.headers = currentHeader;
      handler.next(options);
    } else {
      var dioErr = DioException(
          error: const ServerError('server err'),
          requestOptions: options,
          response: null);

      handler.reject(dioErr);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
