part of 'edit_bin_bloc.dart';

enum EditBinStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == EditBinStatus.init;
  bool get isLoading => this == EditBinStatus.loading;
  bool get isSuccess => this == EditBinStatus.success;
  bool get isFailure => this == EditBinStatus.failure;
}

@freezed
class EditBinState with _$EditBinState {
  const factory EditBinState ({
    @Default(EditBinStatus.init) EditBinStatus status,
    BinDetails? response,
    String? errorMessage
  }) = _EditBinState;
}
