part of 'versioning_bloc.dart';

@freezed
class VersioningEvent with _$VersioningEvent {
  const factory VersioningEvent.init() = _InitEvent;
}
