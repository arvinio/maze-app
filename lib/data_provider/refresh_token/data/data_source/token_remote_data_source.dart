import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/data_provider/refresh_token/data/model/refresh_token_response.dart';
import 'package:maze_app/di/di_const.dart';

abstract class TokenRemoteDataSource {
  Future<ApiResponse<RefreshTokenResponse>> generateNewToken({required String refreshToken});
}

@Injectable(as: TokenRemoteDataSource)
class TokenRemoteDataSourceImpl implements TokenRemoteDataSource {
  final DioCaller dioCaller;

  TokenRemoteDataSourceImpl(@Named(DiConst.dioNamedMaze) this.dioCaller);

  @override
  Future<ApiResponse<RefreshTokenResponse>> generateNewToken({required String refreshToken}) {
    return dioCaller.post<RefreshTokenResponse>('api/auth/refresh',
        data: {
          'refresh_token': refreshToken,
        },
        fromJson: RefreshTokenResponse.fromJson);
  }
}
