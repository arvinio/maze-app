import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repo.dart';

part 'tracker_state.dart';
part 'tracker_event.dart';
part 'tracker_bloc.freezed.dart';

@injectable
class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  final TrackerRepo repo;
  int wasteSaved = 0;
  int compostSaved = 0;
  int wasteRecycled = 0;
  bool hasOrganic = false;
  bool hasCompost = false;
  bool hasRecycling = false;
  bool hasLandfill = false;
  var bins = <Bin>[];

  TrackerBloc(this.repo) : super(const TrackerState.initial()) {
    on<_initEvent>(_onInit);
    on<_getBinsListEvent>(_onGetBinsList);
    on<_addBinEvent>(_onAddBin);
  }

  _onInit(_initEvent event, Emitter<TrackerState> emit) async {
    const TrackerEvent.getBinsList();
  }

  _onGetBinsList(_getBinsListEvent event, Emitter<TrackerState> emit) async {
    emit(const TrackerState.loadInProgress());
    final response = await repo.getBinsList();
    response.when(
      completed: (data, statusCode) {
        hasOrganic = data.any((bin) => bin.type == BinType.organic);
        hasCompost = data.any((bin) => bin.type == BinType.compost);
        hasRecycling = data.any((bin) => bin.type == BinType.recycling);
        hasLandfill = data.any((bin) => bin.type == BinType.landfill);
        bins.addAll(data);
        emit(TrackerState.binsLoaded(bins: data));
      },
      error: (apiError) {
        emit(TrackerState.loadingError(error: apiError));
      },
    );
  }

  _onAddBin(_addBinEvent event, Emitter<TrackerState> emit) async {
    // emit(const TrackerState.loadInProgress());
    final response = await repo.createBin(bin: event.bin);
    response.when(
      completed: (data, statusCode) {
        // emit(TrackerState.binsLoaded(bins: data));
      },
      error: (apiError) {
        // emit(TrackerState.loadingError(error: apiError));
      },
    );
  }
}
