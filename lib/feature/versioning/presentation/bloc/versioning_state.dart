part of 'versioning_bloc.dart';

enum VersioningStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == VersioningStatus.init;

  bool get isLoading => this == VersioningStatus.loading;

  bool get isSuccess => this == VersioningStatus.success;

  bool get isFailure => this == VersioningStatus.failure;
}


@freezed
class VersioningState with _$VersioningState {
  const factory VersioningState({
    @Default(VersioningStatus.init) VersioningStatus versioningStatus,
    CheckClientVersionResponse? versionResponse

  }) = _VersioningState;
}
