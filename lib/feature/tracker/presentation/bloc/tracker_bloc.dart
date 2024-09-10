import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';
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
    on<_NavigateToAddNewEntryPage>(_onNavigateToAddNewEntryPage);
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
    // emit(const TrackerState.loadInProgress());
    final updatedBin = await repo.createBinEntry(entry: event.entryDetails);
    updatedBin.when(
      completed: (data, statusCode) {},
      error: (apiError) {
        emit(TrackerState.loadingError(error: apiError));
      },
    );
  }

  _onFetchBinDetails(_FetchBinDetails event, Emitter<TrackerState> emit) async {
    emit(const TrackerState.loadInProgress());
    var hasError = false;
    final binDetailsFuture = repo.getBinDetails(binId: event.binId);
    final entriesFuture = repo.getBinEntryList(binId: event.binId);
    final chartDataFuture = repo.getBinChartData(binId: event.binId);

    final results = await Future.wait([
      binDetailsFuture,
      entriesFuture,
      chartDataFuture,
    ]);

    final binDetailsResult = results[0] as ApiResponse<Bin>;
    final entriesResult = results[1] as ApiResponse<List<EditEntry>>;
    final chartDataResult = results[2] as ApiResponse<BinChartData>;
    late final Bin bin;
    late final List<EditEntry> entries;
    late final BinChartData chartData;
    binDetailsResult.when(
      completed: (data, statusCode) {
        bin = data;
      },
      error: (apiError) {
        hasError = true;
        emit(TrackerState.loadingError(error: apiError));
      },
    );
    entriesResult.when(
      completed: (data, statusCode) {
        entries = data;
      },
      error: (apiError) {
        hasError = true;
        emit(TrackerState.loadingError(error: apiError));
      },
    );
    chartDataResult.when(
      completed: (data, statusCode) {
        chartData = data;
      },
      error: (apiError) {
        hasError = true;
        emit(TrackerState.loadingError(error: apiError));
      },
    );

    if (!hasError) {
      emit(TrackerState.binDetailsLoaded(
        bin: bin,
        entries: entries,
        binChartData: chartData,
      ));
    }
  }

  FutureOr<void> _onNavigateToAddNewEntryPage(
      _NavigateToAddNewEntryPage event, Emitter<TrackerState> emit) {
    emit(TrackerState.navigateToAddNewEntryPage(bin: event.bin));
  }
}

enum EntrySortOption { dateNewest, dateOldest, type }