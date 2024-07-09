import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/remove_bookmark.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/set_bookmark.dart';

part 'article_state.dart';

@injectable
class ArticleCubit extends Cubit<ArticleState> {
  final SetBookmark _setBookmark;
  final RemoveBookmark _removeBookmark;
  final GetArticle _getArticle;
  final AppRouter _router;

  ArticleCubit({
    required SetBookmark setBookmark,
    required RemoveBookmark removeBookmark,
    required GetArticle getArticle,
    required AppRouter router,
  })  : _getArticle = getArticle,
        _removeBookmark = removeBookmark,
        _setBookmark = setBookmark,
        _router = router,
        super(ArticleInitial()) {
    loadArticle();
  }

  Future<void> loadArticle() async {
    emit(LoadingArticle());
    final String id = inject<SettingsManager>().getArticleId();
    final result = await _getArticle(id);
    result.when(
      completed: (data, statusCode) {
        emit(ArticleLoaded(article: data));
      },
      error: (apiError) {
        emit(LoadingFailed(error: apiError));
      },
    );
  }

  Future<bool> toggleBookmark(
      {required bool bookmark, required String id}) async {
    final result =
        bookmark == true ? await _removeBookmark(id) : await _setBookmark(id);

    return result.when(
      completed: (data, statusCode) {
        if (data) {
          if (state is ArticleLoaded) {
            final currentArticle = (state as ArticleLoaded).article;
            final updateArticle = Article(
                id: currentArticle.id,
                text: currentArticle.text,
                category: currentArticle.category,
                imageUrl: currentArticle.imageUrl,
                title: currentArticle.title,
                isBookmark: !bookmark);
            emit(LoadingArticle());
            emit(ArticleLoaded(article: updateArticle));
          }
          return !bookmark;
        } else {
          return bookmark;
        }
        //TODO : show toast
      },
      error: (apiError) {
        return bookmark;
        //TODO : show toast
      },
    );
  }
}
