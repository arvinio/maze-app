import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_request.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_response.dart';

import 'report_remote_data_source.dart';

@Injectable(as:ReportRemoteDataSource)
class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final DioCaller dioCaller;

  ReportRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});

  @override
  Future<ApiResponse<ReportResponse>> reportProblem({required ReportRequest problem}) async{


    FormData formData = FormData.fromMap({
      'subject': problem.subject,
      'description': problem.description,
    });

    for (int i = 0; i < problem.photos!.length; i++) {
      var path = problem.photos![i].path;
      formData.files.addAll([
        MapEntry("photos", await MultipartFile.fromFile(path, filename: path.split('/')
            .last))
      ]);
    }

    return await dioCaller.post<ReportResponse>(
        'api/report/problem', fromJson: ReportResponse.fromJson,
        data: formData
    );
  }
}