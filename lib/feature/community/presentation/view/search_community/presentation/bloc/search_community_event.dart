part of 'search_community_bloc.dart';

@freezed
class SearchCommunityEvent with _$SearchCommunityEvent {
  const factory SearchCommunityEvent.init() = _Init;
  const factory SearchCommunityEvent.queryEvent({required String query}) =
      _QueryEvent;
}
