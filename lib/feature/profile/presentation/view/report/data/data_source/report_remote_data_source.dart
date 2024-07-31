import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_request.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_response.dart';

abstract class ReportRemoteDataSource {
  Future<ApiResponse<ReportResponse>> reportProblem({required ReportRequest problem});

}
