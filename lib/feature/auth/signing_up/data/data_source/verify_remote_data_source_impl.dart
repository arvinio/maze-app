import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/resend_response/resend_response.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/verify_response/verify_response.dart';

@Injectable(as:VerifyRemoteDataSource)
class VerifyRemoteDataSourceImpl implements VerifyRemoteDataSource {
  final DioCaller dioCaller;

  VerifyRemoteDataSourceImpl({@Named(DiConst.dioNamedMaze)  required this.dioCaller});

  @override
  Future<ApiResponse<VerifyResponse>> verify({required String userId, required String code}) async{
    return await dioCaller.post<VerifyResponse>('api/auth/verify', fromJson: VerifyResponse.fromJson,
        data: {
          'userId': userId,
          'code': code
        }
    );
  }

  @override
  Future<ApiResponse<ResendResponse>> resend({required String userId}) async{
    return await dioCaller.post<ResendResponse>('api/auth/resend', fromJson: ResendResponse.fromJson,
        data: {
          'userId': userId,
        }
    );
  }
}