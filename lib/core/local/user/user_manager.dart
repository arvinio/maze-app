import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/local/user/user.dart';

@lazySingleton
class UserManager {
  SettingsManager settingsManager;

  UserManager(this.settingsManager);

  bool isUserLoggedIn() {
    if (settingsManager.getBearerToken()!=null && settingsManager.getBearerToken().isNotEmpty) {
      return true;
    }
    return false;
  }


}
