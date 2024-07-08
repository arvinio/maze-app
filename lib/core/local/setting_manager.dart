import 'package:injectable/injectable.dart';
import 'package:maze_app/core/util/shared_preferences_helper.dart';
import 'package:maze_app/feature/auth/login/data/model/enum/role.dart';

@injectable
class SettingsManager {
  final SharedPreferencesHelper prefs;

  SettingsManager(this.prefs);

  final String _userNameKey = 'user_N_K';
  final String _passwordKey = 'p_w_K';
  final String _jwTokenKey = 'j_w_t_K';
  final String _refreshTokenKey = 'refresh_t_K';
  final String _role = 'role';

  final _isFirstRun = "IS_FIRST_RUNK";

  setUserName(String userName) {
    prefs.setStringAndEncrypt(_userNameKey, userName);
  }

  String getUserName() {
    return prefs.getEncryptedString(_userNameKey);
  }

  setPassword(String pass) {
    prefs.setStringAndEncrypt(_passwordKey, pass);
  }

  String getPassword() {
    return prefs.getEncryptedString(_passwordKey);
  }

  setBearerToken(String bearerToken) {
    prefs.setStringAndEncrypt(_jwTokenKey, bearerToken);
  }

  String getBearerToken() {
    return prefs.getEncryptedString(_jwTokenKey);
  }

  setRefreshToken(String token) {
    prefs.setStringAndEncrypt(_refreshTokenKey, token);
  }

  String getRefreshToken() {
    return prefs.getEncryptedString(_refreshTokenKey);
  }

  setRole(String role) {
    prefs.setString(_role, role);
  }

  Role getRole() {
    String role = prefs.getString(_role);
    return RoleExtension.getRoleByName(role);
  }

 Future<bool> setIsFirstRun() async {
  return await prefs.setInt(_isFirstRun, 1);
  }

  int? getIsFirstRun() {
    final test = prefs.getInt(_isFirstRun);
    return test;
  }
}
