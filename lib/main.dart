import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:maze_app/core/util/shared_preferences_helper.dart';

import 'core/presentation/app.dart';
import 'di/injection_container.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:logging/logging.dart';

/*
Build output files using these commands:
windows=flutter build apk --split-per-abi --obfuscate --split-debug-info=/flutter_projects_symbols/maze_app
linux and mac=flutter build apk --split-per-abi --obfuscate --split-debug-info=~/flutter_projects_symbols/maze_app

google_play_appbundle_mac=flutter build appbundle --obfuscate --split-debug-info=/flutter_projects_symbols/maze_app
see https://docs.flutter.dev/deployment/obfuscate for more information.



web=flutter build web --release

ios_appbundle=flutter build ipa --obfuscate --split-debug-info=/Users/mahdiarabpour/Programming\ Projects/Afterhours/Symbols/ios/1.0.0+1

Upload symbols to Crashlytics:
firebase crashlytics:symbols:upload --app=com.afthr.afterhours /Users/mahdiarabpour/Programming\ Projects/Afterhours/Symbols/debug
 */

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Globals.setSharedPreferences();

  configureDependencies(environment: 'dev');
  const dsn =
      'https://d18530a5bcef0dacb949a11a71803aff@o4507613419929600.ingest.us.sentry.io/4507613422551040';
  await SentryFlutter.init((options) {
    options.dsn = kDebugMode ? '' : dsn;
    options.diagnosticLevel = SentryLevel.info;
    options.tracesSampleRate = 1.0;
    options.addIntegration(LoggingIntegration(minEventLevel: Level.INFO));
  },
      appRunner: () => runApp(App(
            appRouter: inject(),
            appTheme: inject(),
          )));
}
