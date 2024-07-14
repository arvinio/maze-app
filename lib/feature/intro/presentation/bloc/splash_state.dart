part of 'splash_bloc.dart';


enum SplashStatus {
  init,
  loading,
  success,
  userLoggedIn,
  userNotLoggedIn,
  firstRun,
  notFirstRun,
  splashDone,
  failure;

  bool get isInit => this == SplashStatus.init;

  bool get isLoading => this == SplashStatus.loading;

  bool get isSuccess => this == SplashStatus.success;
  bool get isUserLoggedIn => this == SplashStatus.userLoggedIn;
  bool get isUserNotLoggedIn => this == SplashStatus.userNotLoggedIn;
  bool get isFirstRun => this == SplashStatus.firstRun;
  bool get isNotFirstRun => this == SplashStatus.notFirstRun;
  bool get isSplashDone=> this == SplashStatus.splashDone;

  bool get isFailure => this == SplashStatus.failure;
}


@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashStatus.init) SplashStatus splashStatus,

  })=_SplashState;
}

