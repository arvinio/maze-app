part of 'compost_bin_types_bloc.dart';

@freezed
class CompostBinTypesEvent with _$CompostBinTypesEvent {
  const factory CompostBinTypesEvent.init() = _Init;
  const factory CompostBinTypesEvent.getCompostBinTypesEvent() = _GetCompostBinTypesEvent;

}
