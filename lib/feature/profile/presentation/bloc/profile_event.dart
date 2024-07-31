part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.init() = _Init;
  const factory ProfileEvent.getProfileEvent() = _GetProfileEvent;
  const factory ProfileEvent.changePasswordEvent({required String currentPassword,required String password}) = _ChangePasswordEvent;
  const factory ProfileEvent.uploadCoverPhotoEvent({required File cover}) = _UploadCoverPhotoEvent;
  const factory ProfileEvent.changeEmailEvent({required String email}) = _ChangeEmailEvent;
  const factory ProfileEvent.editProfileEvent({required EditProfileRequest profileRequest}) = _EditProfileEvent;
  const factory ProfileEvent.editProfileDetailEvent(  {required EditDetailsRequest detailsParam}) = _EditProfileDetailEvent;
  const factory ProfileEvent.editHouseholdInfoEvent(  {required EditHouseholdRequest householdParam}) = _EditHouseholdInfoEvent;
  const factory ProfileEvent.setSelectedResultEvent(  Result selectedResult,EntryMode entryMode) = _SetSelectedResultEvent;
  const factory ProfileEvent.deleteAvatarEvent() = _DeleteAvatarEvent;
  const factory ProfileEvent.deleteCoverEvent() = _DeleteCoverEvent;
  const factory ProfileEvent.deleteAccountEvent() = _DeleteAccountEvent;
}
