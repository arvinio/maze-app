part of 'bin_details_bloc.dart';

enum BinDetailsStatus {
  init,
  loading,
  success,
  muted,
  unMuted,
  failureMuted,
  failureUnMuted,
  failure;

  bool get isInit => this == BinDetailsStatus.init;
  bool get isLoading => this == BinDetailsStatus.loading;
  bool get isSuccess => this == BinDetailsStatus.success;
  bool get isMuted => this == BinDetailsStatus.muted;
  bool get isUnMuted => this == BinDetailsStatus.unMuted;
  bool get isFailureMuted => this == BinDetailsStatus.failureMuted;
  bool get isFailureUnMuted => this == BinDetailsStatus.failureUnMuted;
  bool get isFailure => this == BinDetailsStatus.failure;
}

@freezed
class BinDetailsState with _$BinDetailsState {
  const factory BinDetailsState ({
    @Default(BinDetailsStatus.init) BinDetailsStatus status,
    BinDetails? response,
    String? errorMessage
  }) = _BinDetailsState;
}

