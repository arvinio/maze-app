import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../di/injection_container.dart';
import 'config/const.dart';

Dio provideDio(
    {
    required String baseUrl,
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


  dio.interceptors.add(inject<PrettyDioLogger>());


  return dio;
}
