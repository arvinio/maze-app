part of 'search_community_bloc.dart';

sealed class SearchCommunityEvent extends Equatable {
  const SearchCommunityEvent();

  @override
  List<Object> get props => [];
}

class SearchCommunityWithQueryEvent extends SearchCommunityEvent {
  final String query;

  const SearchCommunityWithQueryEvent({required this.query});

  @override
  List<Object> get props => [query];
}
