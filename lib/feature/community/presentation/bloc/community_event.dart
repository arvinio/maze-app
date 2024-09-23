part of 'community_bloc.dart';

@freezed
class CommunityEvent with _$CommunityEvent {
  const factory CommunityEvent.init() = _Init;
  const factory CommunityEvent.getCommunityDetailsEvent( {required String id}) = _GetCommunityDetailsEvent;
  const factory CommunityEvent.getMyCommunitiesEvent( ) = _GetMyCommunitiesEvent;
  const factory CommunityEvent.getOtherCommunitiesEvent( ) = _GetOtherCommunitiesEvent;

}
