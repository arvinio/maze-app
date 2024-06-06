import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/network/dio_caller.dart';
import '../core/network/dio_provider.dart';
import 'di_const.dart';
import 'injection_container.config.dart';

final _getIt = GetIt.instance;
String? strFlavorName;

@InjectableInit(initializerName: 'init')
void configureDependencies({required String environment})  {
   _getIt.init(environment: environment);
  strFlavorName = environment;
}


@module
abstract class NetworkModule {
  @lazySingleton
  Logger get logger => Logger();

  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(requestHeader: true, requestBody: true);

  @Named(DiConst.versioning)
  @lazySingleton
  Dio provideMazeDio(PrettyDioLogger prettyDioLogger) => provideDio(
    baseUrl: 'https://9d75e0d2-4c70-4fe4-87d6-3ac6ee464387.mock.pstmn.io/versioningSystem/',
  );

  @Named(DiConst.versioning)
  @lazySingleton
  DioCaller provideMazeDioCaller(@Named(DiConst.versioning) Dio dio) => DioCaller(dio: dio);

}


T inject<T extends Object>({dynamic param1, dynamic param2}) => _getIt.get<T>(param1: param1, param2: param2);