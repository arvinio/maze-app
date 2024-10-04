import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_caller.dart';
import '../../../../core/network/model/api_response.dart';
import '../model/refresh_token_response.dart';
import '../../../../di/di_const.dart';

abstract class TokenRemoteDataSource {
  Future<ApiResponse<RefreshTokenResponse>> generateNewToken(
      {required String refreshToken});
}

@Injectable(as: TokenRemoteDataSource)
class TokenRemoteDataSourceImpl implements TokenRemoteDataSource {
  final DioCaller dioCaller;

  TokenRemoteDataSourceImpl(@Named(DiConst.dioNamedMaze) this.dioCaller);

  @override
  Future<ApiResponse<RefreshTokenResponse>> generateNewToken(
      {required String refreshToken}) {
    return dioCaller.post<RefreshTokenResponse>('api/auth/refresh',
        data: {
          'refreshToken': refreshToken,
        },
        fromJson: RefreshTokenResponse.fromJson);
  }
}
