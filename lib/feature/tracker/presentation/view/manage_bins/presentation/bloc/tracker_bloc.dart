import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';
part 'tracker_bloc.freezed.dart';

@injectable
class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  final TrackerRepository repository;
  int compostSaved = 0;
  bool hasCompost = false;
  bool hasLandfill = false;

  var bins = <Bin>[];
  TrackerBloc(this.repository) : super(const TrackerState()) {
    on<_Init>(_onInit);
    on<_GetBinsList>(_onGetBinsList);
  }


  _onInit(_Init event, Emitter<TrackerState> emit) async {
    emit(state.copyWith(status: TrackerStatus.init));
  }


  _onGetBinsList(_GetBinsList event, Emitter<TrackerState> emit) async {
    emit(state.copyWith(status: TrackerStatus.loading));

    final response = await repository.getBinsList();
    response.when(
      completed: (data, statusCode) {
        hasCompost = data.any((bin) => bin.type == BinType.compost);
        hasLandfill = data.any((bin) => bin.type == BinType.landfill);
        bins.clear();
        bins.addAll(data);
        emit(state.copyWith(status: TrackerStatus.success,bins:data));

      },
      error: (apiError) {
        emit(state.copyWith(status: TrackerStatus.failure,
            errorMessage: apiError.message));
      },
    );
  }
}