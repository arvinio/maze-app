import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:maze_app/feature/profile/data/model/%20profile_response/profile_response.dart';
import 'package:maze_app/feature/profile/data/model/change_email_response/change_email_response.dart';
import 'package:maze_app/feature/profile/data/model/change_password_request/change_password_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_details_request/edit_details_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_household_request/edit_household_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_request/edit_profile_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_response/edit_profile_response.dart';

@Injectable(as:ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioCaller dioCaller;

  ProfileRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});


  @override
  Future<ApiResponse> getProfile() async {
    return await dioCaller.get('api/user', fromJson: ProfileResponse.fromJson);
  }

  @override
  Future<ApiResponse<EditProfileResponse>> changePassword(
      {required ChangePasswordRequest request}) async {
    return await dioCaller.post<EditProfileResponse>(
        'api/user/changePass', fromJson: EditProfileResponse.fromJson,
        data: {
          "currentPassword": request.currentPassword,
          "password": request.password
        }
    );
  }


  @override
  Future<ApiResponse<EditProfileResponse>> uploadCoverPhoto(
      {required File cover}) async {
    File file = cover;
    var fileName = file.path
        .split('/')
        .last;

    FormData formData = FormData.fromMap({
      'cover': await MultipartFile.fromFile(file.path, filename: fileName),
    });

    return await dioCaller.post<EditProfileResponse>(
        'api/user/cover', fromJson: EditProfileResponse.fromJson,
        data: formData
    );
  }

  @override
  Future<ApiResponse<ChangeEmailResponse>> changeEmail(
      {required String email}) async {
    return await dioCaller.put<ChangeEmailResponse>(
        'api/user/change-email', fromJson: ChangeEmailResponse.fromJson,
        data: {
          'email': email
        }
    );
  }

  @override
  Future<ApiResponse<EditProfileResponse>> editProfile(
      {required EditProfileRequest profileParam}) async {

    FormData formData = FormData.fromMap({
      'username': profileParam.username,
      'about': profileParam.about
    });

    if (profileParam.avatar != null) {
      File avatarFile = profileParam.avatar!;
      var avatarFileName = avatarFile.path
          .split('/')
          .last;

      formData.files.add(MapEntry("avatar", await MultipartFile.fromFile(avatarFile.path, filename: avatarFileName)));

    }
    if (profileParam.cover != null) {
      File coverFile = profileParam.cover!;
      var coverFileName = coverFile.path
          .split('/')
          .last;

      formData.files.add(MapEntry("cover", await MultipartFile.fromFile(coverFile.path, filename: coverFileName)));
    }



    return await dioCaller.put<EditProfileResponse>(
        'api/user/profile', fromJson: EditProfileResponse.fromJson,
        data: formData
    );
  }


  @override
  Future<ApiResponse<EditProfileResponse>> editProfileDetail(
      {required EditDetailsRequest detailsParam}) async {
    return await dioCaller.put<EditProfileResponse>(
        'api/user/details', fromJson: EditProfileResponse.fromJson,
        data: {
          'firstName': detailsParam.firstName,
          'lastName': detailsParam.lastName,
          'birthDate': detailsParam.birthDate
        }
    );
  }


  @override
  Future<ApiResponse<EditProfileResponse>> editProfileHouseholdInfo(
      {required EditHouseholdRequest householdParam}) async {
    return await dioCaller.put<EditProfileResponse>(
        'api/user/household', fromJson: EditProfileResponse.fromJson,
        data: {
          'country': householdParam.country,
          'state': householdParam.state,
          'council': householdParam.council,
          'postcode': householdParam.postcode,
          'householdSize': householdParam.householdSize,
          'measurementSystem': householdParam.measurementSystem
        }
    );
  }

  @override
  Future<ApiResponse> deleteAvatar() {
    return dioCaller.delete(
        'api/user/avatar', fromJson: EditProfileResponse.fromJson);
  }

  @override
  Future<ApiResponse> deleteCover() {
    return dioCaller.delete(
        'api/user/cover', fromJson: EditProfileResponse.fromJson);
  }

  @override
  Future<ApiResponse> deleteAccount() {
    return dioCaller.delete('api/user', fromJson: EditProfileResponse.fromJson);
  }

}