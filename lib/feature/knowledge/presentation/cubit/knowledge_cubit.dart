import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart';

part 'knowledge_state.dart';

@injectable
class KnowledgeCubit extends Cubit<KnowledgeState> {
  final GetArticles _getArticles;
  final AppRouter _router;
  final List<Article> _articles = [];

  KnowledgeCubit({
    required GetArticles getArticles,
    required AppRouter router,
  })  : _getArticles = getArticles,
        _router = router,
        super(KnowledgeInitial()) {
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    emit(LoadingState());
    final result = await _getArticles();

    result.when(
      completed: (data, statusCode) {
        _articles.isEmpty ? null : _articles.clear();
        _articles.addAll(data);
        emit(LoadedState(articles: data));
      },
      error: (apiError) {
        emit(ErrorState(error: apiError));
      },
    );
  }

  void loadArticle({required Article article}) {
    _router.push(ArticlePageRoute(article: article));
  }

  void loadBookmarks() {
    final bookmarks = _articles.where((element) => element.isBookmark).toList();
    _router.push(BookmarksPageRoute(bookMarks: bookmarks));
  }
}
