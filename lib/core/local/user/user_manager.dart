import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/local/user/user.dart';

@lazySingleton
class UserManager {
  User? _currentUser;

  User? get currentUser => _currentUser;
  SettingsManager settingsManager;

  UserManager(this.settingsManager);

  login(User user) {
    settingsManager.setUserName(user.userName ?? '');
    settingsManager.setPassword(user.password ?? '');
    settingsManager.setBearerToken(user.bearerToken);
  }
}
