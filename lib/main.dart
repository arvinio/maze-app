import 'package:flutter/material.dart';
import 'package:maze_app/core/util/shared_preferences_helper.dart';

import 'core/presentation/app.dart';
import 'di/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Globals.setSharedPreferences();

  configureDependencies(environment: 'dev');

  runApp( App(appRouter: inject(), appTheme: inject(),));
}
