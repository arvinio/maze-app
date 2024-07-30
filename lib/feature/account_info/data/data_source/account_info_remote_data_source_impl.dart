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

    FormData formData = FormData.fromMap({
      'notification': userInfoParam.notification,
      'householdSize':userInfoParam.householdSize
    });

    if (userInfoParam.firstName!.isNotEmpty) {
      formData.fields.add(
          MapEntry("firstName",userInfoParam.firstName!));
    }


    if ( userInfoParam.lastName!.isNotEmpty) {
      formData.fields.add(
          MapEntry("lastName",userInfoParam.lastName!));
    }

    if (userInfoParam.birthDate !=null ) {
      formData.fields.add(
          MapEntry("birthDate",userInfoParam.birthDate!));
    }

    if ( userInfoParam.username!.isNotEmpty) {
      formData.fields.add(
          MapEntry("username",userInfoParam.username!));
    }

    if (userInfoParam.country !=null ) {
      formData.fields.add(
          MapEntry("country",userInfoParam.country!));
    }
    if (userInfoParam.state !=null ) {
      formData.fields.add(
          MapEntry("state",userInfoParam.state!));
    }
    if (userInfoParam.council !=null ) {
      formData.fields.add(
          MapEntry("council",userInfoParam.council!));
    }

    if ( userInfoParam.postcode!.isNotEmpty) {
      formData.fields.add(
          MapEntry("postcode",userInfoParam.postcode!));
    }


    if (userInfoParam.avatar != null) {
      File file = userInfoParam.avatar!;
      var fileName = file.path
          .split('/')
          .last;

      formData.files.add(MapEntry("avatar", await MultipartFile.fromFile(file.path, filename: fileName)));
    }

    return await dioCaller.post<RegisterDetailsResponse>(
        'api/user/details', fromJson: RegisterDetailsResponse.fromJson,
        data: formData
    );
  }
}