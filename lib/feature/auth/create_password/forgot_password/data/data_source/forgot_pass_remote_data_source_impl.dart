import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/data/model/forgot_password_response.dart';

@Injectable(as:ForgotPassRemoteDataSource)
class ForgotPassRemoteDataSourceImpl implements ForgotPassRemoteDataSource
{
  final DioCaller dioCaller;

  ForgotPassRemoteDataSourceImpl({@Named(DiConst.dioNamedMaze) required this.dioCaller});



  @override
  Future<ApiResponse<ForgotPasswordResponse>> forgotPassword({required String email}) async{
    return  await dioCaller.post<ForgotPasswordResponse>('api/auth/forgot',
        fromJson: ForgotPasswordResponse.fromJson,
        data:{'email':email} );
  }
}