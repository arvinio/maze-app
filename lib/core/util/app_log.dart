import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class AppLog {
  final Logger logger;

  AppLog(this.logger);

  kPrint(String msg) {
    if (kDebugMode) {
      logger.i('============>>> : $msg');
    }
  }
  logD2(String tag, String msg) {
    if (kDebugMode) {
      logger.i('$tag ============>>> : $msg');
    }
  }
}
