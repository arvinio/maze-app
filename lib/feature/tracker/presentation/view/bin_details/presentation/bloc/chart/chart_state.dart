part of 'chart_bloc.dart';

enum ChartDataStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == ChartDataStatus.init;
  bool get isLoading => this == ChartDataStatus.loading;
  bool get isSuccess => this == ChartDataStatus.success;
  bool get isFailure => this == ChartDataStatus.failure;
}

@freezed
class ChartState with _$ChartState {
  const factory ChartState ({
  @Default(ChartDataStatus.init) ChartDataStatus status,
    BinChartData? chartData,
  String? errorMessage
  }) = _ChartState;
  }
