import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/cubit/firebase_cubit/firebase_cubit.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/style/app_theme.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  final AppTheme appTheme;

  const App({super.key, required this.appRouter, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FirebaseCubit(),
            // this should be instanciated in app startup to setup firebase
            lazy: false,
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appTheme.appThemeLight(context),
          darkTheme: appTheme.appThemeDark(context),
          routerDelegate: appRouter.delegate(),
          routeInformationProvider: appRouter.routeInfoProvider(),
          routeInformationParser: appRouter.defaultRouteParser(),
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}
