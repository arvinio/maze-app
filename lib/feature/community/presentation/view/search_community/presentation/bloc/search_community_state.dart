part of 'search_community_bloc.dart';

enum SearchCommunityStatus {
  init,
  loading,
  success,
  failure,
  searchLoading,
  searchSuccess,
  searchFailure;

  bool get isInit => this == SearchCommunityStatus.init;
  bool get isLoading => this == SearchCommunityStatus.loading;
  bool get isSuccess => this == SearchCommunityStatus.success;
  bool get isFailure => this == SearchCommunityStatus.failure;
  bool get isSearchLoading => this == SearchCommunityStatus.searchLoading;
  bool get isSearchSuccess => this == SearchCommunityStatus.searchSuccess;
  bool get isSearchFailure => this == SearchCommunityStatus.searchFailure;
}

@freezed
class SearchCommunityState with _$SearchCommunityState {
  const factory SearchCommunityState(
      {@Default(SearchCommunityStatus.init) SearchCommunityStatus searchStatus,
      Map<String, List<SearchResponse>>? searchResults,
      @Default(true) bool isEmpty,
      String? errorMessage}) = _SearchCommunityState;
}
