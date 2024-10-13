part of 'edit_community_bloc.dart';

@freezed
class EditCommunityEvent with _$EditCommunityEvent {
  const factory EditCommunityEvent.init() = _Init;
  const factory EditCommunityEvent.editCommunityEvent( {required CommunityDetails communityRequest , File? avatarFile , File? coverFile}) = _EditCommunityEvent;
}