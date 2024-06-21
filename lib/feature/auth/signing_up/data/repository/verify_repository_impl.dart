import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart';
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart';

@Injectable(as:VerifyRepository)
class VerifyRepositoryImpl implements VerifyRepository
{
  final VerifyRemoteDataSource remoteDataSource;

  VerifyRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> verify({required String userId, required String code}) async{
   return await remoteDataSource.verify(userId: userId, code: code);
  }

  @override
  Future<ApiResponse> resend({required String userId}) async{
    return await remoteDataSource.resend(userId: userId);

  }

}