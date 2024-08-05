part of 'tracker_bloc.dart';

@freezed
class TrackerEvent with _$TrackerEvent {
  const factory TrackerEvent.init() = _initEvent;
  const factory TrackerEvent.getBinsList() = _getBinsListEvent;
  const factory TrackerEvent.addBin({required Bin bin}) = _addBinEvent;
}
