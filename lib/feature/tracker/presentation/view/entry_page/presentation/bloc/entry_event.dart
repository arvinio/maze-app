part of 'entry_bloc.dart';

@freezed
class EntryEvent with _$EntryEvent {
  const factory EntryEvent.init() = _Init;
  const factory EntryEvent.getBinEntries({required String binId }) = _GetBinEntries;
}
