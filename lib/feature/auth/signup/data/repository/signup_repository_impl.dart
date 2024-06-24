import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source.dart';
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart';

@Injectable(as:SignupRepository)
class SignupRepositoryImpl implements  SignupRepository
{
  final SignupRemoteDataSource remoteDataSource;

  SignupRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> signUp({ required String email}) async{
    return await remoteDataSource.signUp(email: email);

  }
}