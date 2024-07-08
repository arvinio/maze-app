import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/di/injection_container.dart';

import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart';
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart';

part 'intro_state.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  final AppRouter _router;

  IntroCubit(
      {required GetIsFirstRun getIsFirstRun,
      required SetIsFirstRun setIsFirstRun,
      required AppRouter router})
      : _router = router,
        super(IntroInitial()) {
    checkIsFirstRun();
  }
  Future<void> setFirstRunDone() async {
    await inject<SettingsManager>().setIsFirstRun();
    _goToNextPage();
  }

  Future<void> checkIsFirstRun() async {
    int isFirstRun = inject<SettingsManager>().getIsFirstRun() ?? 0;
    inject<SettingsManager>().getBearerToken();
    FlutterNativeSplash.remove();
    if (isFirstRun == 1) {
      _goToNextPage();
    }
  }

  void _goToNextPage() {
    _router.popAndPush(const SignupPageRoute());
  }
}
