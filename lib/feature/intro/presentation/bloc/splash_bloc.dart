import 'package:bloc/bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/local/user/user_manager.dart';
import 'package:maze_app/di/injection_container.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserManager userManager;

  SplashBloc(this.userManager) : super(const SplashState()) {
    on<_InitEvent>(_onInit);
    on<_OnLoadAppDataEvent>(_onLoadAppData);
    on<_CheckIsFirstRunEvent>(_checkIsFirstRun);
    on<_OnDoneEvent>(_onDone);
  }

  _onInit(_InitEvent event, Emitter<SplashState> emit) async {
    // FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(splashStatus: SplashStatus.success));
  }

  _onLoadAppData(_OnLoadAppDataEvent event, Emitter<SplashState> emit) async {
    if (userManager.isUserLoggedIn()) {
      emit(state.copyWith(splashStatus: SplashStatus.userLoggedIn));
    } else {
      emit(state.copyWith(splashStatus: SplashStatus.userNotLoggedIn));
    }
  }

  _checkIsFirstRun(
      _CheckIsFirstRunEvent event, Emitter<SplashState> emit) async {
    int isFirstRun = inject<SettingsManager>().getIsFirstRun() ?? 0;

    if (isFirstRun == 1) {
      emit(state.copyWith(splashStatus: SplashStatus.notFirstRun));
    } else {
      emit(state.copyWith(splashStatus: SplashStatus.firstRun));
    }
  }

  _onDone(_OnDoneEvent event, Emitter<SplashState> emit) async {
    await inject<SettingsManager>().setIsFirstRun();
    emit(state.copyWith(splashStatus: SplashStatus.splashDone));
  }
}
