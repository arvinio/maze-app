import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:maze_app/core/util/shared_preferences_helper.dart';

import 'core/presentation/app.dart';
import 'di/injection_container.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Globals.setSharedPreferences();

  configureDependencies(environment: 'dev');

  runApp(App(
    appRouter: inject(),
    appTheme: inject(),
  ));
}
