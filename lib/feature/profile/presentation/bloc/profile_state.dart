part of 'profile_bloc.dart';

enum ProfileStatus {
  init,
  loading,
  success,
  uploadCoverSuccess,
  uploadCoverFailure,
  editProfileSuccess,
  editProfileFailure,
  notifyChangeFieldsValue,
  deleteCoverSuccess,
  deleteCoverFailure,
  deleteSuccess,
  deleteFailure,
  failure;

  bool get isInit => this == ProfileStatus.init;
  bool get isLoading => this == ProfileStatus.loading;
  bool get isSuccess => this == ProfileStatus.success;
  bool get isFailure=> this == ProfileStatus.failure;
  bool get isUploadCoverSuccess => this == ProfileStatus.uploadCoverSuccess;
  bool get isUploadCoverFailure => this == ProfileStatus.uploadCoverFailure;
  bool get isEditProfileSuccess => this == ProfileStatus.editProfileSuccess;
  bool get isEditProfileFailure => this == ProfileStatus.editProfileFailure;
  bool get isNotifyChangeFieldsValue => this == ProfileStatus.notifyChangeFieldsValue;
  bool get isDeleteCoverSuccess => this == ProfileStatus.deleteCoverSuccess;
  bool get isDeleteCoverFailure => this == ProfileStatus.deleteCoverFailure;
  bool get isDeleteSuccess => this == ProfileStatus.deleteSuccess;
  bool get isDeleteFailure => this == ProfileStatus.deleteFailure;

}


@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.init) ProfileStatus  profileStatus,
    ProfileResponse? response,
    EditProfileResponse? editResponse,
    ChangeEmailResponse? changeEmailResponse,
    Result? selectedResult,
    EntryMode? entryMode,
    String? errorMessage

  })=_ProfileState;
}