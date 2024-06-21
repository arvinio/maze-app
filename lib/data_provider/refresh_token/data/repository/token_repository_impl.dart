import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/data_provider/refresh_token/data/data_source/token_remote_data_source.dart';
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart';

@Injectable(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  final TokenRemoteDataSource tokenRemoteDataSource;

  TokenRepositoryImpl(this.tokenRemoteDataSource);

  @override
  Future<ApiResponse> generateNewToken({required String refreshToken}) {
    return tokenRemoteDataSource.generateNewToken(refreshToken: refreshToken);

  }
}
