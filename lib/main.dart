import 'package:flutter/material.dart';

import 'core/presentation/app.dart';
import 'di/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

   configureDependencies(environment: 'dev');

  runApp( App(appRouter: inject(), appTheme: inject(),));
}
