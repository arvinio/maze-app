import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/profile/data/model/%20profile_response/profile_response.dart';
import 'package:maze_app/feature/profile/data/model/change_password_request/change_password_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_details_request/edit_details_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_household_request/edit_household_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_request/edit_profile_request.dart';
import 'package:maze_app/feature/profile/data/model/edit_profile_response/edit_profile_response.dart';
import 'package:maze_app/feature/profile/domain/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc(this.repository) : super(const ProfileState()) {
    on<_Init>(_onInit);
    on<_GetProfileEvent>(_onGetProfile);
    on<_ChangePasswordEvent>(_onChangePassword);
    on<_UploadCoverPhotoEvent>(_onUploadCoverPhoto);
    on<_ChangeEmailEvent>(_onChangeEmail);
    on<_EditProfileEvent>(_onEditProfile);
    on<_EditProfileDetailEvent>(_onEditProfileDetail);
    on<_EditHouseholdInfoEvent>(_onEditHouseholdInfo);
    on<_SetSelectedResultEvent>(_onSetSelectedResult);
    on<_DeleteAvatarEvent>(_onDeleteAvatar);
    on<_DeleteCoverEvent>(_onDeleteCover);
    on<_DeleteAccountEvent>(_onDeleteAccount);
  }

  _onInit(_Init event, Emitter<ProfileState> emit) async {}

  _onGetProfile(_GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    final apiResponse=await repository.getProfile();
    apiResponse.when(completed: (data,int? statusCode){

      ProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.success,response: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.failure,errorMessage: apiError.message));
    });
  }

  _onChangePassword(_ChangePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    var changePasswordRequest = ChangePasswordRequest(
      currentPassword: event.currentPassword,
      password: event.password
       );

    final apiResponse=await repository.changePassword(request:changePasswordRequest );
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;

      emit(state.copyWith(profileStatus: ProfileStatus.success,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.failure,errorMessage: apiError.message));
    });
  }

  _onUploadCoverPhoto(_UploadCoverPhotoEvent event, Emitter<ProfileState> emit) async {

    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    final apiResponse=await repository.uploadCoverPhoto(cover: event.cover);
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.uploadCoverSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.uploadCoverFailure,errorMessage: apiError.message));
    });
  }

  _onChangeEmail(_ChangeEmailEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    final apiResponse=await repository.changeEmail(email: event.email);
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.success,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.failure,errorMessage: apiError.message));
    });
  }

  _onEditProfile(_EditProfileEvent event, Emitter<ProfileState> emit) async {

    final apiResponse=await repository.editProfile(profileParam: event.profileRequest);
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.editProfileSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.editProfileFailure,errorMessage: apiError.message));
    });
  }

  _onEditProfileDetail(_EditProfileDetailEvent event, Emitter<ProfileState> emit) async {

    final apiResponse=await repository.editProfileDetail(detailsParam: event.detailsParam);
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.editProfileSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.editProfileFailure,errorMessage: apiError.message));
    });
  }

  _onEditHouseholdInfo(_EditHouseholdInfoEvent event, Emitter<ProfileState> emit) async {

    final apiResponse=await repository.editProfileHouseholdInfo(householdParam: event.householdParam);
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.editProfileSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.editProfileFailure,errorMessage: apiError.message));
    });
  }

  _onSetSelectedResult(_SetSelectedResultEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
        profileStatus: ProfileStatus.notifyChangeFieldsValue,
        entryMode: event.entryMode,
        selectedResult: event.selectedResult));
  }

  _onDeleteAvatar(_DeleteAvatarEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    final apiResponse=await repository.deleteAvatar();
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.deleteSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.deleteFailure,errorMessage: apiError.message));
    });
  }

  _onDeleteCover(_DeleteCoverEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    final apiResponse=await repository.deleteCover();
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.deleteCoverSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.deleteCoverFailure,errorMessage: apiError.message));
    });
  }

  _onDeleteAccount(_DeleteAccountEvent event, Emitter<ProfileState> emit) async {
   // emit(state.copyWith(profileStatus: ProfileStatus.loading));

    final apiResponse=await repository.deleteAccount();
    apiResponse.when(completed: (data,int? statusCode){

      EditProfileResponse response=data;
      emit(state.copyWith(profileStatus: ProfileStatus.deleteSuccess,editResponse: response));

    }, error: (apiError){
      emit(state.copyWith(profileStatus: ProfileStatus.deleteFailure,errorMessage: apiError.message));
    });
  }



}
