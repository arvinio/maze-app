import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source.dart';
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart';

@Injectable(as:CreatePasswordRepository)
class CreatePasswordRepositoryImpl implements CreatePasswordRepository
{
final CreatePasswordRemoteDataSource remoteDataSource;

CreatePasswordRepositoryImpl(this.remoteDataSource);



  @override
  Future<ApiResponse> setPassword({required String password}) async{
    return await remoteDataSource.setPassword(password: password);

  }
}
