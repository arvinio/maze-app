import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio_error_handler.dart';
import 'model/api_error.dart';
import 'model/api_response.dart';

abstract class DioCaller {
  const factory DioCaller({required Dio dio}) = _DioCallerStandardImpl;

  Future<ApiResponse<D>> post<D>(String path, {required Function? fromJson, data, Options? options});

  Future<ApiResponse<D>> get<D>(String path,
      {required Function? fromJson, Map<String, dynamic>? queryParameters, Options? options});

  Future<ApiResponse<D>> put<D>(String path, {required Function fromJson, data, Options? options});

  Future<ApiResponse<D>> patch<D>(String path, {required Function fromJson, data, Options? options});

  Future<ApiResponse<D>> delete<D>(String path, {required Function fromJson, data, Options? options});
}

class _DioCallerStandardImpl implements DioCaller {
  final Dio dio;

  const _DioCallerStandardImpl({required this.dio});

  @override
  Future<ApiResponse<D>> get<D>(String path,
      {required Function? fromJson, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {

      final response = await dio.get(path, queryParameters: queryParameters, options: options);
      return _isSuccessfulStatusCode(response.statusCode)
          ? ApiResponse.completed(data: fromJson!.call(response.data), statusCode: response.statusCode)
          : ApiResponse.error(apiError: handleDioError(response: response));
    } on DioException catch (e) {
      return ApiResponse.error(apiError: handleDioError(dioError: e, response: e.response));
    } catch (e) {
      log("====================== $e");
      return ApiResponse.error(apiError: handleDioError());
    }
  }

  @override
  Future<ApiResponse<D>> post<D>(String path, {required Function? fromJson, data, Options? options}) async {
    try {
      final response = await dio.post(path, data: data, options: options);

      return _isSuccessfulStatusCode(response.statusCode)
          ? ApiResponse<D>.completed(data: fromJson?.call(response.data), statusCode: response.statusCode)
          : ApiResponse<D>.error(apiError: handleDioError(response: response));
    } on DioException catch (e) {
      ApiError error = handleDioError(dioError: e, response: e.response);

      return ApiResponse<D>.error(apiError: handleDioError(dioError: e, response: e.response));
    } catch (e) {
      log("catch  ==> ${e.toString()}");
      return ApiResponse<D>.error(apiError: handleDioError());
    }
  }

  @override
  Future<ApiResponse<D>> delete<D>(
    String path, {
    required Function fromJson,
    data,
    Options? options,
  }) async {
    try {
      final response = await dio.delete(path, data: data, options: options);

      return _isSuccessfulStatusCode(response.statusCode)
          ? ApiResponse.completed(data: fromJson.call(response.data), statusCode: response.statusCode)
          : ApiResponse.error(apiError: handleDioError(response: response));
    } on DioException catch (e) {
      return ApiResponse.error(apiError: handleDioError(dioError: e, response: e.response));
    } catch (e) {
      return ApiResponse.error(apiError: handleDioError());
    }
  }

  @override
  Future<ApiResponse<D>> patch<D>(
    String path, {
    required Function fromJson,
    data,
    Options? options,
  }) async {
    try {
      final response = await dio.patch(path, data: data, options: options);

      return _isSuccessfulStatusCode(response.statusCode)
          ? ApiResponse.completed(data: fromJson.call(response.data), statusCode: response.statusCode)
          : ApiResponse.error(apiError: handleDioError(response: response));
    } on DioException catch (e) {
      return ApiResponse.error(apiError: handleDioError(dioError: e, response: e.response));
    } catch (e) {
      return ApiResponse.error(apiError: handleDioError());
    }
  }

  @override
  Future<ApiResponse<D>> put<D>(
    String path, {
    required Function fromJson,
    data,
    Options? options,
  }) async {
    try {
      final response = await dio.put(path, data: data, options: options);

      return _isSuccessfulStatusCode(response.statusCode)
          ? ApiResponse.completed(data: fromJson.call(response.data), statusCode: response.statusCode)
          : ApiResponse.error(apiError: handleDioError(response: response));
    } on DioException catch (e) {
      return ApiResponse.error(apiError: handleDioError(dioError: e, response: e.response));
    } catch (e) {
      return ApiResponse.error(apiError: handleDioError());
    }
  }

  bool _isSuccessfulStatusCode(int? httpStatusCode) =>
      httpStatusCode == null ? false : (httpStatusCode >= 200 && httpStatusCode < 300);
}
