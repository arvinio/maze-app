import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/feature/knowledge/domain/entity/app_category.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_categories.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/search_articles.dart';

part 'knowledge_state.dart';

@injectable
class KnowledgeCubit extends Cubit<KnowledgeState> {
  final GetArticles _getArticles;
  final AppRouter _router;
  final GetCategories _getCategories;
  final SearchArticles _searchArticles;

  final List<Article> _articles = [];

  KnowledgeCubit({
    required GetArticles getArticles,
    required AppRouter router,
    required SearchArticles searchArticles,
    required GetCategories getCategories,
  })  : _getArticles = getArticles,
        _router = router,
        _getCategories = getCategories,
        _searchArticles = searchArticles,
        super(KnowledgeInitial()) {
    _load();
  }

  Future<void> _load() async {
    List<AppCategory> categories = [];
    emit(LoadingArticles());
    final result = await _getArticles();
    final categoryResults = await _getCategories();
    categoryResults.when(
      completed: (data, statusCode) {
        categories.addAll(data);
      },
      error: (apiError) {},
    );
    result.when(
      completed: (data, statusCode) {
        _articles.isEmpty ? null : _articles.clear();
        _articles.addAll(data);
        emit(
          ArticlesLoaded(
            articles: data,
            categories: categories,
          ),
        );
      },
      error: (apiError) {
        emit(ErrorLoadingArticles(error: apiError));
      },
    );
  }

  void loadArticle({required Article article}) {
    _router.push(ArticlePageRoute(article: article));
  }

  void loadBookmarks() {
    _router.push(const BookmarksPageRoute());
  }
}
