part of 'tracker_bloc.dart';

enum TrackerStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == TrackerStatus.init;
  bool get isLoading => this == TrackerStatus.loading;
  bool get isSuccess => this == TrackerStatus.success;
  bool get isFailure => this == TrackerStatus.failure;
}

@freezed
class TrackerState with _$TrackerState {
  const factory TrackerState({
    @Default(TrackerStatus.init) TrackerStatus status,
    @Default([]) List<Bin>? bins,
    String? errorMessage
  }) = _TrackerState;
}
