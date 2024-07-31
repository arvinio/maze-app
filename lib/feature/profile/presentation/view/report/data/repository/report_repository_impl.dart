import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/data_source/report_remote_data_source.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_request.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_response.dart';
import 'package:maze_app/feature/profile/presentation/view/report/domain/repository/report_repository.dart';

@Injectable(as:ReportRepository)
class ReportRepositoryImpl implements ReportRepository
{
  final ReportRemoteDataSource remoteDataSource;

  ReportRepositoryImpl(this.remoteDataSource);



  @override
  Future<ApiResponse<ReportResponse>> reportProblem({required ReportRequest problem}) {
   return remoteDataSource.reportProblem(problem: problem);
  }



}
