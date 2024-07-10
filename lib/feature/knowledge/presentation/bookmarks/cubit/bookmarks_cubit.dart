import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/remove_bookmark.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/set_bookmark.dart';

part 'bookmarks_state.dart';

@injectable
class BookmarksCubit extends Cubit<BookmarksState> {
  final AppRouter _router;
  final GetBookmarks _getBookmarks;
  final RemoveBookmark _removeBookmark;
  final SetBookmark _setBookmark;
  BookmarksCubit({
    required GetBookmarks getBookmarks,
    required AppRouter router,
    required RemoveBookmark removeBookmark,
    required SetBookmark setBookmark,
  })  : _getBookmarks = getBookmarks,
        _removeBookmark = removeBookmark,
        _setBookmark = setBookmark,
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

  void loadArticle(String id) {
    inject<SettingsManager>().setArticleId(id);
    _router.push(ArticlePageRoute());
  }

  Future<void> setBookmark({required bool bookmark, required String id}) async {
    final result =
        bookmark == true ? await _removeBookmark(id) : await _setBookmark(id);
  }
}
