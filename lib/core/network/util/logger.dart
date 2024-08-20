import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// [LoggingInterceptor] is used to print logs during network requests.
/// It's better to add [LoggingInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  late final _logger=Logger('LoggingInterceptor');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint('=================Dio======================');
    logPrint('*** API Request - Start ***');

    printKV('URI', options.uri);
    printKV('METHOD', options.method);
    logPrint('HEADERS:');
    options.headers.forEach((key, v) => printKV(' - $key', v));
    logPrint('BODY:');
    printAll(options.data ?? "");
    logPrint('QUERY:');
    printAll(options.queryParameters ?? "");

    logPrint('*** API Request - End ***');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint('*** Api Error - Start ***:');

    logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response?.statusCode}');
    }
    logPrint('$err');
    if (err.response != null) {
      printKV('REDIRECT', err.response?.realUri ?? '');
      logPrint('BODY:');
      printAll(err.response?.toString());
    }

    logPrint('*** Api Error - End ***:');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('*** Api Response - Start ***');

    printKV('URI', response.requestOptions.uri);
    printKV('STATUS CODE', response.statusCode ?? '');
    printKV('REDIRECT', response.isRedirect ?? false);
    logPrint('BODY:');
    printAll(response.data ?? "");

    logPrint('*** Api Response - End ***');
    logPrint('=================Dio======================');

    super.onResponse(response, handler);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
    _logger.log(Level.INFO, '$key: $v');

  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
    _logger.log(Level.FINE, s);

  }
}