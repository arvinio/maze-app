import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    splashLoading();
  }
  Future<void> setFirstRunDone() async {
    await inject<SettingsManager>().setIsFirstRun();
    _goToSignUpPage();
  }

  Future<void> splashLoading() async {
    FlutterNativeSplash.remove();
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 2));
    await checkIsFirstRun();
  }

  Future<void> checkIsFirstRun() async {
    int isFirstRun = inject<SettingsManager>().getIsFirstRun() ?? 0;

    if (isFirstRun == 1) {
      _goToSignUpPage();
    } else {
      _router.popAndPush(const IntroPageRoute());
    }
  }

  void _goToSignUpPage() {
    _router.popAndPush(const SignupPageRoute());
    // _router.popAndPush(const BottomNavigationRoute());
  }
}
