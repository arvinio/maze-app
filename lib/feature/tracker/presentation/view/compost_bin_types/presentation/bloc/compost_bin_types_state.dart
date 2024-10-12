part of 'compost_bin_types_bloc.dart';


enum CompostBinTypesStatus {
  init,
  loading,
  loadCompostBinTypes,
  failure;

  bool get isInit => this == CompostBinTypesStatus.init;
  bool get isLoading => this == CompostBinTypesStatus.loading;
  bool get isLoadCompostBinTypes => this == CompostBinTypesStatus.loadCompostBinTypes;
  bool get isFailure => this == CompostBinTypesStatus.failure;
}


@freezed
class CompostBinTypesState with _$CompostBinTypesState {
  const factory CompostBinTypesState({
    @Default(CompostBinTypesStatus.init) CompostBinTypesStatus status,
    @Default([]) List<CompostBinTypes>? retrievedCompostBinTypes,
    String? errorMessage
  }) = _CompostBinTypesState;
}


