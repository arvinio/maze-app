import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/util/app_log.dart';
import 'package:maze_app/data_provider/refresh_token/data/model/refresh_token_response.dart';
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart';


@injectable
class TokenManager {
  final SettingsManager _settingsManager;
  final TokenRepository _repository;
  final AppLog _appLog;

  TokenManager(this._settingsManager, this._repository, this._appLog);

  Future<String?> getToken() async {
    String? token = _settingsManager.getBearerToken();
    bool isExpire = isExpiredToken(token);

    if (token.isEmpty || isExpire) {
      await _generateNewToken().then((value) {
        token = value.token;
      }).onError((error, stackTrace) {
        _appLog.kPrint('err');
        token=null;
      });
    }
    return token;
  }

  Future<_TokensModel> _generateNewToken() async {
    var apiResponse = await _repository.generateNewToken(refreshToken: _settingsManager.getRefreshToken());
    final completer = Completer<_TokensModel>();

    await apiResponse.when(completed: (data, int? statusCode) {
      RefreshTokenResponse response = data;
      _TokensModel tokens = _TokensModel(token: response.token!, success: response.success!);
      _appLog.kPrint(
          'generateNewToken ==> token: ${response.token}');
      completer.complete(tokens);

    }, error: (apiError) {
      _appLog.kPrint(' apiError generateNewToken ${apiError.message}');
      completer.completeError(apiError);
    });
    return completer.future;
  }

  isExpiredToken(String token) {
    if (token=='null'||token.isEmpty) return true;
    bool hasExpired = JwtDecoder.isExpired(token);
    // You will get a true / false response
    // true: if the token is already expired
    // false: if the token is not expired
    return hasExpired;
  }
}

class _TokensModel {
  final bool success;
  final String token;

  _TokensModel({required this.success, required this.token});
}
