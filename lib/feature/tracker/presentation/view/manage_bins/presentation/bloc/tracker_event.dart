part of 'tracker_bloc.dart';

@freezed
class TrackerEvent with _$TrackerEvent {
  const factory TrackerEvent.init() = _Init;
  const factory TrackerEvent.getBinsList() = _GetBinsList;
}
