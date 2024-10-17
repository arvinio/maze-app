import 'dart:io';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/profile/core/util/change_password_request/change_password_request.dart';
import 'package:maze_app/feature/profile/core/util/edit_details_request/edit_details_request.dart';
import 'package:maze_app/feature/profile/core/util/edit_household_request/edit_household_request.dart';
import 'package:maze_app/feature/profile/core/util/edit_profile_request/edit_profile_request.dart';
import 'package:maze_app/feature/profile/data/model/change_email_response/change_email_response.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_response/edit_profile_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse> getProfile();
  Future<ApiResponse<EditProfileResponse>> changePassword({required ChangePasswordRequest request});
  Future<ApiResponse<EditProfileResponse>> uploadCoverPhoto({required File cover});
  Future<ApiResponse<ChangeEmailResponse>> changeEmail(  {required String email});
  Future<ApiResponse<EditProfileResponse>> editProfile(  {required EditProfileRequest profileParam});
  Future<ApiResponse<EditProfileResponse>> editProfileDetail(  {required EditDetailsRequest detailsParam});
  Future<ApiResponse<EditProfileResponse>> editProfileHouseholdInfo(  {required EditHouseholdRequest householdParam});
  Future<ApiResponse> deleteAvatar();
  Future<ApiResponse> deleteCover();
  Future<ApiResponse> deleteAccount();
  Future<ApiResponse> getCommunityProfile();

}
