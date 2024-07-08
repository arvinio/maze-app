import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/account_info/data/data_source/account_info_remote_data_source.dart';
import 'package:maze_app/feature/account_info/data/model/register_details_response.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:maze_app/feature/account_info/domain/repository/account_info_repository.dart';

@Injectable(as:AccountInfoRepository)
class AccountInfoRepositoryImpl implements AccountInfoRepository
{
  final AccountInfoRemoteRemoteDataSource remoteDataSource;

  AccountInfoRepositoryImpl(this.remoteDataSource);



  @override
  Future<ApiResponse> getCountryList() async{
    return await remoteDataSource.getCountryList();

  }


  @override
  Future<ApiResponse> getStateList({required String countryId}) async{
    return await remoteDataSource.getSateList(countryId: countryId);

  }


  @override
  Future<ApiResponse> getCouncilList({required String stateId}) async{
    return await remoteDataSource.getCouncilList(stateId: stateId);

  }

  @override
  Future<ApiResponse<RegisterDetailsResponse>> registerDetails({required UserInfo userInfoParam}) async{
    return await remoteDataSource.registerDetails(userInfoParam: userInfoParam);

  }

 

}
