import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

final _getIt = GetIt.instance;
String? strFlavorName;

@InjectableInit(initializerName: 'init')
void configureDependencies({required String environment})  {
   _getIt.init(environment: environment);
  strFlavorName = environment;
}

T inject<T extends Object>({dynamic param1, dynamic param2}) => _getIt.get<T>(param1: param1, param2: param2);