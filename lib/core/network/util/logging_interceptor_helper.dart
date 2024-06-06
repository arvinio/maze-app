import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptorHelper {
  static void requestLogger(RequestOptions options) async {
    if (kDebugMode) {
    print(
        '--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${'' + (options.baseUrl ?? '') +
            (options.path ?? '')}');
    print('Headers:');
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print('queryParameters:');
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print('Body: ${options.data}');
    }
    print('--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}');
  }
  }

  static void responseLogger(Response options) async {
    if(kDebugMode){
      print(
          '<-- ${options.statusCode} ${(options.requestOptions != null ? (options.requestOptions.baseUrl + options.requestOptions.path) : 'URL')}');
      print('Headers:');
      options.headers.forEach((k, v) => print('$k: $v'));
      print('Response: ${options.data}');
      print('<-- END HTTP');
    }
  }

  static void errorLogger(DioError dioError) {
    if(kDebugMode){
    print(
        '<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}');
    print('${dioError.response != null ? dioError.response!.data : 'Unknown Error'}');
    print('<-- End error');}
  }

  static void keyValueLogger(String title, String message) {
    if(kDebugMode){
      print('<-- $title =====> $message');
      print('<-- End logger');
    }
  }
  static void printMessageLogger( String message) {
    if(kDebugMode){
      print('<-- $message');
      print('<-- End logger');
    }
  }
}
