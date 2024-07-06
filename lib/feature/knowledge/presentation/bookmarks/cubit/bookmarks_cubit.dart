import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart';

part 'bookmarks_state.dart';

@injectable
class BookmarksCubit extends Cubit<BookmarksState> {
  final AppRouter _router;
  final GetBookmarks _getBookmarks;
  BookmarksCubit({
    required GetBookmarks getBookmarks,
    required AppRouter router,
  })  : _getBookmarks = getBookmarks,
        _router = router,
        super(BookmarksInitial()) {
    _loadBookmarks();
  }

  final List<Article> _bookMarks = [];
  Future<void> _loadBookmarks() async {
    
    emit(LoadingBookmarks());
    final result = await _getBookmarks();

    result.when(
      completed: (data, statusCode) {
        _bookMarks.isEmpty ? null : _bookMarks.clear();
        _bookMarks.addAll(data);

        emit(
          BookmarksLoaded(
            articles: data,
          ),
        );
      },
      error: (apiError) {
        emit(ErrorLoadingBookmarks(error: apiError));
      },
    );
  }
}
