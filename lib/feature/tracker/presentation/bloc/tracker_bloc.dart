import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/data/model/enum/create_bin_types.dart';
import 'package:maze_app/feature/tracker/data/model/success_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

part 'tracker_state.dart';
part 'tracker_event.dart';
part 'tracker_bloc.freezed.dart';

@injectable
class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  final TrackerRepository repository;
  int compostSaved = 0;
  bool hasCompost = false;
  bool hasLandfill = false;

  var bins = <Bin>[];

  TrackerBloc(this.repository) : super(const TrackerState.initial()) {
    on<_AddEntryToBin>(_onAddEntryToBin);
    on<_initEvent>(_onInit);
    on<_GetBinsList>(_onGetBinsList);
    on<_NavigateToAddNewEntryPage>(_onNavigateToAddNewEntryPage);
  }

  _onInit(_initEvent event, Emitter<TrackerState> emit) async {
    add(const TrackerEvent.getBinsList());
  }

  _onGetBinsList(_GetBinsList event, Emitter<TrackerState> emit) async {
    emit(const TrackerState.loadInProgress());
    final response = await repository.getBinsList();
    response.when(
      completed: (data, statusCode) {
        hasCompost = data.any((bin) => bin.type == BinType.compost);
        hasLandfill = data.any((bin) => bin.type == BinType.landfill);
        bins.clear();
        bins.addAll(data);
        emit(TrackerState.binsLoaded(bins: data));
      },
      error: (apiError) {
        emit(TrackerState.loadingError(error: apiError));
      },
    );
  }

  _onAddEntryToBin(_AddEntryToBin event, Emitter<TrackerState> emit) async {
    // emit(const TrackerState.loadInProgress());
    final updatedBin = await repository.createBinEntry(entry: event.entryDetails);
    updatedBin.when(
      completed: (data, statusCode) {},
      error: (apiError) {
        emit(TrackerState.loadingError(error: apiError));
      },
    );
  }

  FutureOr<void> _onNavigateToAddNewEntryPage(
      _NavigateToAddNewEntryPage event, Emitter<TrackerState> emit) {
    emit(TrackerState.navigateToAddNewEntryPage(bin: event.bin));
  }
}

