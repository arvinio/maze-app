import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/style/app_theme.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  final AppTheme appTheme;

  const App({super.key, required this.appRouter, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme.appThemeLight(context),
      darkTheme: appTheme.appThemeDark(context),
      routerDelegate: appRouter.delegate(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      routeInformationParser: appRouter.defaultRouteParser(),

    );
  }
}
