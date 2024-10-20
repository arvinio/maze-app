part of 'edit_bin_bloc.dart';

@freezed
class EditBinEvent with _$EditBinEvent {
  const factory EditBinEvent.init() = _Init;
  const factory EditBinEvent.editBin({required Bin bin }) = _EditBin;
  const factory EditBinEvent.getBinDetails({required String binId}) = _GetBinDetails;
}
