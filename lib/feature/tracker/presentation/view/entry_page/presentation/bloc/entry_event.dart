part of 'entry_bloc.dart';

@freezed
class EntryEvent with _$EntryEvent {
  const factory EntryEvent.init() = _Init;
  const factory EntryEvent.getBinEntries({required String binId,required String sort }) = _GetBinEntries;
  const factory EntryEvent.addEntryToBin({ required Entry entryDetails}) = _AddEntryToBin;
  const factory EntryEvent.deleteBinEntry({required String entryId }) = _DeleteBinEntry;

}
