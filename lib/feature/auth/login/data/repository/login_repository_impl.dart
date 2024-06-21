import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart';

import '../data_source/login_remote_data_source.dart';

@Injectable(as:LoginRepository)
class LoginRepositoryImpl implements LoginRepository
{
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);


  @override
  Future<ApiResponse> login({required String email, required String password}) async{
    return await remoteDataSource.login(email: email, password: password);

  }

}
