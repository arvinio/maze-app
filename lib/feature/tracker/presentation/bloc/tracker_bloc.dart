import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

import 'package:maze_app/feature/tracker/domain/repo/tracker_repo.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

part 'tracker_state.dart';
part 'tracker_event.dart';
part 'tracker_bloc.freezed.dart';

@injectable
class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  final TrackerRepo repo;
  int wasteSaved = 0;
  int compostSaved = 0;
  int wasteRecycled = 0;
  bool hasCompost = false;
  bool hasLandfill = false;
  var bins = <Bin>[];

  TrackerBloc(this.repo) : super(const TrackerState.initial()) {
    on<_AddEntryToBin>(_onAddEntryToBin);
    on<_FetchBinDetails>(_onFetchBinDetails);
    on<_initEvent>(_onInit);
    on<_GetBinsList>(_onGetBinsList);
    on<_AddBin>(_onAddBin);
  }

  _onInit(_initEvent event, Emitter<TrackerState> emit) async {
    add(const TrackerEvent.getBinsList());
  }

  _onGetBinsList(_GetBinsList event, Emitter<TrackerState> emit) async {
    emit(const TrackerState.loadInProgress());
    final response = await repo.getBinsList();
    response.when(
      completed: (data, statusCode) {
        hasCompost = data.any((bin) => bin.type == BinType.compost);
        hasLandfill = data.any((bin) => bin.type == BinType.landfill);
        bins.addAll(data);
        emit(TrackerState.binsLoaded(bins: data));
      },
      error: (apiError) {
        emit(TrackerState.loadingError(error: apiError));
      },
    );
  }

  _onAddBin(_AddBin event, Emitter<TrackerState> emit) async {
    final response = await repo.createBin(bin: event.bin);
    response.when(
      completed: (data, statusCode) {
        // Handle add bin logic here
      },
      error: (apiError) {
        // Handle error
      },
    );
  }

  _onAddEntryToBin(_AddEntryToBin event, Emitter<TrackerState> emit) async {
    // final updatedBin =
    //     await repo.createBinEntry(event.binId, event.entryDetails);
    // final binDetails = await repo.getBinDetails(updatedBin);
    // emit(TrackerState.binDetailsLoaded(bin: updatedBin, details: binDetails));
  }

  _onFetchBinDetails(_FetchBinDetails event, Emitter<TrackerState> emit) async {
    emit(const TrackerState.loadInProgress());
    final details = await repo.getBinEntryList(binId: event.bin.id!);
    details.when(
      completed: (data, statusCode) {
        emit(TrackerState.binDetailsLoaded(bin: event.bin, entries: data));
      },
      error: (apiError) {
        emit(TrackerState.loadingError(error: apiError));
      },
    );
  }
}
