part of 'create_bins_type_bloc.dart';


enum CreateBinsTypeStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == CreateBinsTypeStatus.init;
  bool get isLoading => this == CreateBinsTypeStatus.loading;
  bool get isSuccess => this == CreateBinsTypeStatus.success;
  bool get isFailure => this == CreateBinsTypeStatus.failure;
}


@freezed
class CreateBinsTypeState with _$CreateBinsTypeState {
  const factory CreateBinsTypeState({
    @Default(CreateBinsTypeStatus.init) CreateBinsTypeStatus status,
    String? errorMessage
  }) = _CreateBinsTypeState;
}
