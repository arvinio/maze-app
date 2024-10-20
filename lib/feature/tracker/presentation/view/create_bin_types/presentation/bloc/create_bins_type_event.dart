part of 'create_bins_type_bloc.dart';

@freezed
class CreateBinsTypeEvent with _$CreateBinsTypeEvent {
  const factory CreateBinsTypeEvent.init() = _Init;
  const factory CreateBinsTypeEvent.createBin({required Bin bin,required BinTypesEnum binType }) = _CreateBin;
}
