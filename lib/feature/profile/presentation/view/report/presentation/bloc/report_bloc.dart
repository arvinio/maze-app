import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_request.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_response.dart';
import 'package:maze_app/feature/profile/presentation/view/report/domain/repository/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository repository;

  ReportBloc(this.repository) : super(const ReportState()) {
    on<_Init>(_onInit);
    on<_ReportProblemEvent>(_onReportProblem);
  }

  _onInit(_Init event, Emitter<ReportState> emit) async {}

  _onReportProblem(_ReportProblemEvent event, Emitter<ReportState> emit) async {
    emit(state.copyWith(reportStatus: ReportStatus.loading));

    final apiResponse=await repository.reportProblem(problem:event.request );
    apiResponse.when(completed: (data,int? statusCode){

      ReportResponse response=data;
      emit(state.copyWith(reportStatus: ReportStatus.success,response: response));

    }, error: (apiError){
      emit(state.copyWith(reportStatus: ReportStatus.failure,errorMessage: apiError.message));
    });
  }

}
