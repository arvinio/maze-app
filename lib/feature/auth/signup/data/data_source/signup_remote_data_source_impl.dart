import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/auth/signup/data/model/signup_response.dart';

import 'signup_remote_data_source.dart';

@Injectable(as:SignupRemoteDataSource)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSource
{
  final DioCaller dioCaller;

  SignupRemoteDataSourceImpl({@Named(DiConst.dioNamedMaze) required this.dioCaller});

  @override
  Future<ApiResponse<SignupResponse>> signUp({ required String email} ) async{
    return  await dioCaller.post<SignupResponse>('api/auth/signup',
        fromJson: SignupResponse.fromJson,
      data:{'email':email} );
  }
}