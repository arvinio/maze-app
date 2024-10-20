part of 'chart_bloc.dart';

@freezed
class ChartEvent with _$ChartEvent {
  const factory ChartEvent.init() = _Init;
  const factory ChartEvent.getBinChartData({required String binId }) = _GetBinChartData;
}
