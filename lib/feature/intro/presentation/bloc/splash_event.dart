part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.init() = _InitEvent;
  const factory SplashEvent.onLoadAppData() = _OnLoadAppDataEvent;
  const factory SplashEvent.checkIsFirstRun() = _CheckIsFirstRunEvent;
  const factory SplashEvent.onDone() = _OnDoneEvent;

}
