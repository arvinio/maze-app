part of 'manage_bins_bloc.dart';

enum ManageBinsStatus {
  init,
  loading,
  deleted,
  deleteFailure,
  transferSuccess,
  transferFailure,
  fetchDeletedBins,
  restored,
  failure;

  bool get isInit => this == ManageBinsStatus.init;
  bool get isLoading => this == ManageBinsStatus.loading;
  bool get isDeleted => this == ManageBinsStatus.deleted;
  bool get isDeleteFailure => this == ManageBinsStatus.deleteFailure;
  bool get isTransferSuccess => this == ManageBinsStatus.transferSuccess;
  bool get isTransferFailure => this == ManageBinsStatus.transferFailure;
  bool get isFetchDeletedBins => this == ManageBinsStatus.fetchDeletedBins;
  bool get isRestored => this == ManageBinsStatus.restored;
  bool get isFailure => this == ManageBinsStatus.failure;
}

@freezed
class ManageBinsState with _$ManageBinsState {
  const factory ManageBinsState({
    @Default(ManageBinsStatus.init) ManageBinsStatus status,
    @Default([]) List<DeletedBin>? deletedBins,
    String? errorMessage
}) = _ManageBinsState;
}
