part of 'bookmarks_cubit.dart';

sealed class BookmarksState extends Equatable {
  const BookmarksState();

  @override
  List<Object> get props => [];
}

final class BookmarksInitial extends BookmarksState {}




final class LoadingBookmarks extends BookmarksState {}

final class BookmarksLoaded extends BookmarksState {
  final List<Article> articles;

  const BookmarksLoaded({
    required this.articles,
  });
}

final class ErrorLoadingBookmarks extends BookmarksState {
  final ApiError error;

  const ErrorLoadingBookmarks({required this.error});
}
