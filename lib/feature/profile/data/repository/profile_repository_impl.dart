import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:maze_app/feature/profile/data/model/change_password_request/change_password_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_details_request/edit_details_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_household_request/edit_household_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_request/edit_profile_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_response/edit_profile_response.dart';
import 'package:maze_app/feature/profile/domain/repository/profile_repository.dart';

@Injectable(as:ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository
{
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> getProfile() {
    return remoteDataSource.getProfile();
  }

  @override
  Future<ApiResponse<EditProfileResponse>> changePassword({required ChangePasswordRequest request}) {
    return remoteDataSource.changePassword( request: request);
  }
  
  @override
  Future<ApiResponse<EditProfileResponse>> uploadCoverPhoto({required File cover}) {
    return remoteDataSource.uploadCoverPhoto(cover: cover);
  }

  @override
  Future<ApiResponse<EditProfileResponse>> changeEmail({required String email}) {
    return remoteDataSource.changeEmail(email: email);
  }

  @override
  Future<ApiResponse<EditProfileResponse>> editProfile({required EditProfileRequest profileParam}) {
    return remoteDataSource.editProfile(profileParam: profileParam);
  }

  @override
  Future<ApiResponse<EditProfileResponse>> editProfileDetail({required EditDetailsRequest detailsParam}) {
    return remoteDataSource.editProfileDetail(detailsParam: detailsParam);
  }

  @override
  Future<ApiResponse<EditProfileResponse>> editProfileHouseholdInfo({required EditHouseholdRequest householdParam}) {
    return remoteDataSource.editProfileHouseholdInfo(householdParam: householdParam);
  }


  @override
  Future<ApiResponse> deleteAvatar() {
    return remoteDataSource.deleteAvatar();
  }

  @override
  Future<ApiResponse> deleteCover() {
    return remoteDataSource.deleteCover();
  }

  @override
  Future<ApiResponse> deleteAccount() {
    return remoteDataSource.deleteAccount();
  }

}
