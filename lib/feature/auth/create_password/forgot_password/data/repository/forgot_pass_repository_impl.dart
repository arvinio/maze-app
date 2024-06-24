import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart';

@Injectable(as:ForgotPassRepository)
class ForgotPassRepositoryImpl implements  ForgotPassRepository
{
  final ForgotPassRemoteDataSource remoteDataSource;

  ForgotPassRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> forgotPassword({required String email}) async{
    return await remoteDataSource.forgotPassword(email: email);

  }



}