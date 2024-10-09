part of 'manage_bins_bloc.dart';

@freezed
class ManageBinsEvent with _$ManageBinsEvent {
  const factory ManageBinsEvent.init() = _Init;
  const factory ManageBinsEvent.deleteBin({required String id}) = _DeleteBin;
  const factory ManageBinsEvent.deleteBinPermanently({required String id}) = _DeleteBinPermanently;
  const factory ManageBinsEvent.restoreBin({required String id}) = _RestoreBin;
  const factory ManageBinsEvent.getDeletedBins() = _GetDeletedBins;
  const factory ManageBinsEvent.transferBinData({required String sourceBinId,required String targetBinId}) = _TransferBinData;
}
