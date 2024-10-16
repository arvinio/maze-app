part of 'community_profile_bloc.dart';

@freezed
class CommunityProfileEvent with _$CommunityProfileEvent {
  const factory CommunityProfileEvent.init() = _Init;
  const factory CommunityProfileEvent.getCommunityProfile() = _GetCommunityProfile;
}
