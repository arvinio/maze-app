part of 'tracker_bloc.dart';

@freezed
class TrackerState with _$TrackerState {
  const factory TrackerState.initial() = _Initial;
  const factory TrackerState.loadInProgress() = _LoadInProgress;
  const factory TrackerState.binsLoaded({required List<Bin> bins}) =
      _BinsLoaded;
  const factory TrackerState.loadingError({required ApiError error}) =
      _LoadingError;
  const factory TrackerState.binDetailsLoaded(
      {required Bin bin,
      required List<EditEntry> entries,
      required BinChartData binChartData}) = _BinDetailsLoaded;
  const factory TrackerState.navigateToAddNewEntryPage({required Bin bin}) =
      _NavigateToAddNewEntryPageState;
  const factory TrackerState.sortingEntries() = _SortingEntries;
}