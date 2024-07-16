import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/account_info/data/model/register_details_response.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';

import 'account_info_remote_data_source.dart';

@Injectable(as:AccountInfoRemoteRemoteDataSource)
class AccountInfoRemoteRemoteDataSourceImpl implements AccountInfoRemoteRemoteDataSource {
  final DioCaller dioCaller;

  AccountInfoRemoteRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});


  @override
  Future<ApiResponse> getCountryList() async {
    return await dioCaller.get(
        'api/country', fromJson: AccountInfoResponse.fromJson);
  }

  @override
  Future<ApiResponse> getSateList({required String countryId}) async {
    return await dioCaller.get('api/state?countryId=$countryId',
        fromJson: AccountInfoResponse.fromJson);
  }


  @override
  Future<ApiResponse> getCouncilList({required String stateId}) async {
    return await dioCaller.get(
        'api/council?stateId=$stateId', fromJson: AccountInfoResponse.fromJson);
  }

  @override
  Future<ApiResponse<RegisterDetailsResponse>> registerDetails(
      {required UserInfo userInfoParam}) async {
    File file = userInfoParam.avatar!;
    var fileName = file.path
        .split('/')
        .last;

    FormData formData = FormData.fromMap({
      'firstName': userInfoParam.firstName,
      'lastName': userInfoParam.lastName,
      'birthDate': userInfoParam.birthDate,
      'username': userInfoParam.username,
      'notification': userInfoParam.notification,
      'country': userInfoParam.country,
      'state': userInfoParam.state,
      'council': userInfoParam.council,
      'postcode': userInfoParam.postcode,
      'householdSize': userInfoParam.householdSize,
      'avatar': await MultipartFile.fromFile(file.path, filename: fileName),
    });

    return await dioCaller.post<RegisterDetailsResponse>(
      'api/user/details', fromJson: RegisterDetailsResponse.fromJson,
      data: formData
    );
  }
}