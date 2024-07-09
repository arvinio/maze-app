import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/login/data/model/enum/role.dart';
import 'package:maze_app/feature/knowledge/domain/entity/app_category.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/entity/create_edit_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/create_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/delete_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/edit_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_categories.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/remove_bookmark.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/search_articles.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/set_bookmark.dart';

part 'knowledge_state.dart';

@injectable
class KnowledgeCubit extends Cubit<KnowledgeState> {
  final GetArticles _getArticles;
  final AppRouter _router;
  final GetCategories _getCategories;
  final SearchArticles _searchArticles;

  ///
  final CreateArticle _createArticle;
  final EditArticle _editArticle;
  final DeleteArticle _deleteArticle;

  final bool isAdmin = inject<SettingsManager>().getRole() == Role.admin;

  final List<Article> _articles = [];
  final List<AppCategory> _categories = [];

  KnowledgeCubit({
    required GetArticles getArticles,
    required AppRouter router,
    required SearchArticles searchArticles,
    required GetCategories getCategories,
    required SetBookmark setBookmark,
    required RemoveBookmark removeBookmark,
    required GetArticle getArticle,
    required CreateArticle createArticle,
    required DeleteArticle deleteArticle,
    required EditArticle editArticle,
  })  : _getArticles = getArticles,
        _router = router,
        _getCategories = getCategories,
        _searchArticles = searchArticles,
        _createArticle = createArticle,
        _deleteArticle = deleteArticle,
        _editArticle = editArticle,
        super(KnowledgeInitial()) {
    _load();
  }

  Future<List<Article>> search(String input) async {
    final result = await _searchArticles(input);
    return result.when(
      completed: (data, statusCode) {
        return data;
      },
      error: (apiError) {
        throw Exception(apiError.message);
      },
    );
  }

  Future<void> createArticle(CreateEditArticle article) async {
    final result = await _createArticle(article);
    result.when(
      completed: (data, statusCode) {
        _router.maybePop();
      },
      error: (apiError) {},
    );
  }

  List<DropdownMenuEntry> getCategoriesDropDown() {
    final List<DropdownMenuEntry> dropDownMenu = [];
    for (var element in _categories) {
      dropDownMenu
          .add(DropdownMenuEntry(value: element.id, label: element.name));
    }
    return dropDownMenu;
  }

  Future<void> _load() async {
    emit(LoadingArticles());
    final result = await _getArticles();
    final categoryResults = await _getCategories();
    categoryResults.when(
      completed: (data, statusCode) {
        if (_categories.isNotEmpty) _categories.clear();
        _categories.addAll(data);
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
            categories: _categories,
          ),
        );
      },
      error: (apiError) {
        emit(ErrorLoadingArticles(error: apiError));
      },
    );
  }

  // void goBackFromArticlPage() {
  //   _router.maybePop();
  //   _load();
  //   // emit(ArticlesLoaded(articles: _articles, categories: _categories));
  // }

  void loadBookmarks() {
    _router.push(const BookmarksPageRoute());
  }

  void loadArticle(String id) {
    inject<SettingsManager>().setArticleId(id);
    _router.push(const ArticlePageRoute());
  }
}
