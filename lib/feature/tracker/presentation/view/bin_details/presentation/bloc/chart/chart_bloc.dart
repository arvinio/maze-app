import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'chart_event.dart';
part 'chart_state.dart';
part 'chart_bloc.freezed.dart';

@injectable
class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final TrackerRepository repository;

  ChartBloc(this.repository) : super(const ChartState()) {
    on<_Init>(_onInit);
    on<_GetBinChartData>(_onGetBinChartData);
  }

  _onInit(_Init event, Emitter<ChartState> emit) async {
  }

  _onGetBinChartData(_GetBinChartData event, Emitter<ChartState> emit) async {
    emit(state.copyWith(status: ChartDataStatus.loading));
    final response = await repository.getBinChartData(binId: event.binId);
    response.when(completed: (data, int? statusCode) {

      emit(state.copyWith(status: ChartDataStatus.success,chartData: data));
    }, error: (apiError) {
      emit(state.copyWith(status: ChartDataStatus.failure,
          errorMessage: apiError.message));
    });
  }
}