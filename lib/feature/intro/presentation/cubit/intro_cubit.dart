import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/local/user/user_manager.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/di/injection_container.dart';

import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart';
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart';

part 'intro_state.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  final AppRouter _router;
  final UserManager userManager;

  IntroCubit(this.userManager,
      {required GetIsFirstRun getIsFirstRun,
      required SetIsFirstRun setIsFirstRun,
      required AppRouter router})
      : _router = router,
        super(IntroInitial()) {
   // checkIsFirstRun();

  }
  Future<void> setFirstRunDone() async {
    await inject<SettingsManager>().setIsFirstRun();
    _goToNextPage();
  }

  Future<void> checkIsFirstRun() async {
    // inject<SettingsManager>()
    //     .setBearerToken('''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiO
    //     iI2NjgxNmJlNWU2N2ZhZTM0MGNiNWJhMDAiLCJpYXQiOjE3MjA0NT
    //     M5NzYsImV4cCI6MTcyMDQ2ODM3Nn0.mTX0cH5jy3jSY_DEhulJGfc
    //     KKNcvujsv52tMhng8hEo''');
    int isFirstRun = inject<SettingsManager>().getIsFirstRun() ?? 0;

    if (isFirstRun == 1) {
      _goToNextPage();
      FlutterNativeSplash.remove();
    } else {
      FlutterNativeSplash.remove();
    }
  }



  Future<void> onLoadAppData() async {
    if (userManager.isUserLoggedIn()) {
     // emit(UserLoggedIn());
      FlutterNativeSplash.remove();
      _router.popAndPush(const BottomNavigationRoute());

    } else  {
     // emit(UserNotLoggedIn());
      checkIsFirstRun();

    }
  }
  void _goToNextPage() {
    _router.popAndPush(const SignupPageRoute());
    // _router.popAndPush(const BottomNavigationRoute());
  }
}
