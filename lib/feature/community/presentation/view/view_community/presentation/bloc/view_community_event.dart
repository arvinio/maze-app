part of 'view_community_bloc.dart';

@freezed
class ViewCommunityEvent with _$ViewCommunityEvent{
  const factory ViewCommunityEvent.init() = _Init;
  const factory ViewCommunityEvent.joinCommunity({required String id}) = _joinCommunity;
  const factory ViewCommunityEvent.leaveCommunity({required String id}) = _leaveCommunity;
  const factory ViewCommunityEvent.deleteCommunity({required String id}) = _deleteCommunity;
}