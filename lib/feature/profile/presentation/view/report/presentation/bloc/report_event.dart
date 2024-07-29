part of 'report_bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.init() = _Init;
  const factory ReportEvent.reportProblemEvent({required ReportRequest request}) = _ReportProblemEvent;
}
