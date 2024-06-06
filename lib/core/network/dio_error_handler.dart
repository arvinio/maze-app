import 'dart:io';
import 'package:dio/dio.dart';
import 'config/strings.dart';
import 'model/api_error.dart';
import 'model/error_model.dart';


ApiError handleDioError({DioException? dioError, Response? response}) {
  if (dioError != null && ((dioError.error is SocketException))) {
    return const InternetError(Strings.internetError);
  }

  if (response == null) {
    return const UncaughtError(Strings.serverError);
  }

  try {

    final errorModel = ErrorModel.fromJson(response.data);

    switch (response.statusCode) {
      case 400:
        return BadRequest(errorModel.message, errorModel.code);

      case 401:
        return Unauthorized(errorModel.message, errorModel.code);

      case 403:
        return Forbidden(errorModel.message, errorModel.code);

      case 404:
        return const NotFound(Strings.serverError);

      case 423:
        return UnavailableForThisOperation(errorModel.message, errorModel.code);

      case 451:
        return UnavailableForLegalReasons(errorModel.message, errorModel.code);

      case 500:
        return const ServerError(Strings.serverError);

      case 503:
        return ServiceUnavailable(errorModel.message, errorModel.code);

      default:
        return const UncaughtError(Strings.serverError);
    }
  } catch (e) {
    return const UncaughtError(Strings.serverError);
  }
}
