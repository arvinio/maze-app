part of 'bin_details_bloc.dart';

@freezed
class BinDetailsEvent with _$BinDetailsEvent {
  const factory BinDetailsEvent.init() = _Init;
  const factory BinDetailsEvent.editBin({required Bin bin }) = _EditBin;
  const factory BinDetailsEvent.getBinDetails({required String binId}) = _GetBinDetails;
  const factory BinDetailsEvent.muteNotification({required String binId}) = _MuteNotification;
  const factory BinDetailsEvent.unMuteNotification({required String binId}) = _UnMuteNotification;
}
