import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/util/app_log.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';
import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart';
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart';

part 'intro_state.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  final AppRouter _router;

  final GetIsFirstRun _getIsFirstRun;
  final SetIsFirstRun _setIsFirstRun;

  IntroCubit(
      {required GetIsFirstRun getIsFirstRun,
      required SetIsFirstRun setIsFirstRun,
      required AppRouter router})
      : _router = router,
        _getIsFirstRun = getIsFirstRun,
        _setIsFirstRun = setIsFirstRun,
        super(IntroInitial()) {
    checkIsFirstRun();
  }
  void setFirstRunDone() {
    _setIsFirstRun();
    _goToNextPage();
  }

  Future<void> checkIsFirstRun() async {
    final result = await _getIsFirstRun();
    result.when(
      completed: (intro, statusCode) {
        FlutterNativeSplash.remove();
        if (!intro.isFirstRun) {
          _goToNextPage();
        }
      },
      error: (apiError) {
        debugPrint(apiError.message);
      },
    );
  }

  void _goToNextPage() {
    _router.popAndPush(const SignupPageRoute());
  }
}
