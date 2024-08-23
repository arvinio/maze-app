import 'package:dio/dio.dart';
import 'package:maze_app/core/network/util/expire_token_interceptor.dart';
import 'package:maze_app/core/network/util/logger.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../di/injection_container.dart';
import 'config/const.dart';

Dio provideDio(
    {
    required String baseUrl,
      bool isAddTokenToHeaders = false,
      Map<String, String>? customHeaders}) {
  Map<String, String>? headers = customHeaders ?? {};


  final dio = Dio(
    BaseOptions(
        connectTimeout:const Duration(milliseconds: Const.networkTimeout),
        receiveTimeout:const Duration(milliseconds:Const.networkTimeout),
        sendTimeout:const Duration(milliseconds:Const.networkTimeout),
        responseType: ResponseType.json,
        baseUrl: baseUrl,
        headers: headers),
  );

  if(isAddTokenToHeaders){
    ExpireTokenInterceptor expireTokenInterceptor=inject();
    dio.interceptors.add(expireTokenInterceptor);
  }

  dio.interceptors.add(inject<PrettyDioLogger>());
  dio.interceptors.add(LoggingInterceptor());


  return dio;
}
