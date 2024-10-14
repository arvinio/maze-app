part of 'tracker_bloc.dart';

@freezed
class TrackerEvent with _$TrackerEvent {
  const factory TrackerEvent.init() = _initEvent;
  const factory TrackerEvent.getBinsList() = _GetBinsList;
  const factory TrackerEvent.addBin({required Bin bin,required CreateBinTypes binType }) = _AddBin;
  const factory TrackerEvent.navigateToAddNewEntryPage({required Bin bin}) =
      _NavigateToAddNewEntryPage;
  const factory TrackerEvent.navigateToBinDetailsPage({required Bin bin}) =
      _NavigateToBinDetailsPage;
  const factory TrackerEvent.addEntryToBin(
      {required String binId, required Entry entryDetails}) = _AddEntryToBin;
  const factory TrackerEvent.fetchBinDetails({required String binId}) =
      _FetchBinDetails;
  const factory TrackerEvent.sortEntries({
    required String binId,
    required EntrySortOption sortOption,
  }) = _SortEntries;

}
