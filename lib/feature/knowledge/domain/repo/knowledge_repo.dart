import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/knowledge/domain/entity/app_category.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/entity/create_edit_article.dart';

abstract interface class KnowledgeRepo {
  Future<ApiResponse<List<Article>>> getArticles(String params);
  Future<ApiResponse<List<Article>>> getBookmarks();
  Future<ApiResponse<bool>> setBookmark(String id);
  Future<ApiResponse<bool>> removeBookmark(String id);
  Future<ApiResponse<List<Article>>> searchArticles(String params);
  Future<ApiResponse<List<AppCategory>>> getCategories();
  Future<ApiResponse<Article>> getArticle(String id);
  // Admin features
  Future<ApiResponse<bool>> createArticle(CreateEditArticle article);
  Future<ApiResponse<bool>> deleteArticle(String id);
  Future<ApiResponse<bool>> editArticle(CreateEditArticle article);
}
