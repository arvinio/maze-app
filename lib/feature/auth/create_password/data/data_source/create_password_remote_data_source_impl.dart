
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';

import '../model/create_password_response.dart';
import 'create_password_remote_data_source.dart';

@Injectable(as:CreatePasswordRemoteDataSource)
class CreatePasswordRemoteDataSourceImpl implements CreatePasswordRemoteDataSource {
  final DioCaller dioCaller;

  CreatePasswordRemoteDataSourceImpl({@Named(DiConst.dioNamedToken)  required this.dioCaller});

  @override
  Future<ApiResponse<CreatePasswordResponse>> setPassword({required String password}) async{
    return await dioCaller.post<CreatePasswordResponse>('api/user/password', fromJson: CreatePasswordResponse.fromJson,
        data: {
          'password': password,
        }
    );
  }


}