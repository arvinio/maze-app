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

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Globals.setSharedPreferences();

  configureDependencies(environment: 'dev');
    const dsn =
        'https://d18530a5bcef0dacb949a11a71803aff@o4507613419929600.ingest.us.sentry.io/4507613422551040';
    await SentryFlutter.init(
            (options) {
              options.dsn =kDebugMode ? '' : dsn;
          options.diagnosticLevel = SentryLevel.info;
          options.tracesSampleRate = 1.0;
          options.addIntegration(LoggingIntegration(minEventLevel: Level.INFO));
        },
        appRunner: () =>
            runApp(App(
              appRouter: inject(),
              appTheme: inject(),
            )));
}
