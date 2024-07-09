import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/knowledge/data/datasource/knowledge_remote_datasource.dart';
import 'package:maze_app/feature/knowledge/domain/entity/app_category.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@Injectable(as: KnowledgeRepo)
class KnowledgeRepoImpl implements KnowledgeRepo {
  final KnowledgeRemoteDatasource _remoteDatasource;

  KnowledgeRepoImpl({required KnowledgeRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;
  @override
  Future<ApiResponse<List<Article>>> getArticles() async {
    final result = await _remoteDatasource.getArticles();
    return result.when(
      completed: (respModel, statusCode) {
        final List<Article> articles = respModel.result.map(
          (e) {
            return Article(
              id: e.id,
              text: e.content!,
              category: AppCategory(id: e.category!.id, name: e.category!.name),
              imageUrl: e.cover!,
              title: e.title!,
            );
          },
        ).toList();
        return ApiResponse.completed(data: articles);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<List<Article>>> searchArticles(String params) async {
    final result = await _remoteDatasource.searchArticles(params);
    return result.when(
      completed: (respModel, statusCode) {
        final List<Article> articles = respModel.result.map(
          (e) {
            return Article(
              id: e.id,
              text: e.content!,
              category: AppCategory(id: e.category!.id, name: e.category!.name),
              imageUrl: e.cover!,
              title: e.title!,
            );
          },
        ).toList();
        return ApiResponse.completed(data: articles);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<List<AppCategory>>> getCategories() async {
    final result = await _remoteDatasource.getCategories();
    return result.when(
      completed: (respModel, statusCode) {
        final List<AppCategory> categories = respModel.result.map(
          (e) {
            return AppCategory(
              id: e.id,
              name: e.name,
            );
          },
        ).toList();
        return ApiResponse.completed(data: categories);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<bool>> createArticle(Article article) {
    // TODO: implement createArticle
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<bool>> deleteArticle(String id) {
    // TODO: implement deleteArticle
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<bool>> editArticle(Article article) {
    // TODO: implement editArticle
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<Article>> getArticle(String id) async {
    final result = await _remoteDatasource.getArticle(id);
    return result.when(
      completed: (data, statusCode) {
        return ApiResponse.completed(
          data: Article(
            id: data.result.id,
            text: data.result.content!,
            category: AppCategory(
                id: data.result.category!.id, name: data.result.category!.name),
            imageUrl: data.result.cover!,
            title: data.result.title!,
            isBookmark: data.result.isBookmarked!,
          ),
        );
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<List<Article>>> getBookmarks() async {
    final result = await _remoteDatasource.getBookmarks();
    return result.when(
      completed: (respModel, statusCode) {
        final List<Article> articles = respModel.result.map(
          (e) {
            return Article(
              id: e.id,
              text: e.content!,
              category: AppCategory(id: e.category!.id, name: e.category!.name),
              imageUrl: e.cover!,
              title: e.title!,
            );
          },
        ).toList();
        return ApiResponse.completed(data: articles);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<bool>> removeBookmark(String id) async {
    final result = await _remoteDatasource.removeBookmark(id);
    return result.when(
      completed: (data, statusCode) => ApiResponse.completed(data: data.success),
      error: (apiError) => ApiResponse.error(apiError: apiError),
    );
  }

  @override
  Future<ApiResponse<bool>> setBookmark(String id) async {
    final result = await _remoteDatasource.setBookmark(id);
    return result.when(
      completed: (data, statusCode) => ApiResponse.completed(data: data.success),
      error: (apiError) => ApiResponse.error(apiError: apiError),
    );
  }
}
