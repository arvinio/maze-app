import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/core/util/shared_preferences_helper.dart';

abstract interface class IntroLocalDatasource {
  Future<bool> getIsFirstRun();
  Future<bool> setIsFirstRun();
}

@Injectable(as: IntroLocalDatasource)
class IntroLocalDatasourceImpl extends IntroLocalDatasource {
  final SharedPreferencesHelper _helper;

  final _key = "IS_FIRST_RUN";

  IntroLocalDatasourceImpl({required SharedPreferencesHelper helper})
      : _helper = helper;
  @override
  Future<bool> getIsFirstRun() async {
    return await _helper.getBool(_key) ?? true;
  }

  @override
  Future<bool> setIsFirstRun() async {
    return await _helper.setBool(_key, false);
  }
}
