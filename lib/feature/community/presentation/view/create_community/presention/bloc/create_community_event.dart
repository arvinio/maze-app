part of 'create_community_bloc.dart';

@freezed
class CreateCommunityEvent with _$CreateCommunityEvent {
  const factory CreateCommunityEvent.init() = _Init;
  const factory CreateCommunityEvent.newCommunityEvent( {required Community communityRequest}) = _NewCommunityEvent;
}