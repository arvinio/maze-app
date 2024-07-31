part of 'report_bloc.dart';


enum ReportStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == ReportStatus.init;
  bool get isLoading => this == ReportStatus.loading;
  bool get isSuccess => this == ReportStatus.success;
  bool get isFailure=> this == ReportStatus.failure;

}
@freezed
class ReportState with _$ReportState {
  const factory ReportState({
    @Default(ReportStatus.init) ReportStatus  reportStatus,
    ReportResponse? response,
    String? errorMessage

  })=_ReportState;
}
