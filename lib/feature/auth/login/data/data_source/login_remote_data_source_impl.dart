import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/auth/login/data/model/login_response.dart';

import 'login_remote_data_source.dart';


@Injectable(as:LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final DioCaller dioCaller;

  LoginRemoteDataSourceImpl({@Named(DiConst.dioNamedMaze)  required this.dioCaller});

  @override
  Future<ApiResponse<LoginResponse>> login({required String email, required String password}) async{
    return await dioCaller.post<LoginResponse>('api/auth/signin', fromJson: LoginResponse.fromJson,
        data: {
          'email': email,
          'password': password
        }
    );
  }


}
