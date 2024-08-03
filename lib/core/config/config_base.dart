import 'package:injectable/injectable.dart';
import 'package:maze_app/di/di_enviroments.dart';

abstract class ConfigBase{
  String get baseUrl;
}


@LazySingleton(as: ConfigBase, env: development)
 class AppDevConfigs extends ConfigBase{
  @override
  String get baseUrl=>'http://maze-dev.ap-southeast-2.elasticbeanstalk.com/';
}

@LazySingleton(as: ConfigBase, env: production)
 class AppProdConfigs extends ConfigBase{
  @override
  String get baseUrl=>'http://maze.ap-southeast-2.elasticbeanstalk.com/';
}