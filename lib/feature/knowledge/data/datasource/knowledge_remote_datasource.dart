import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/knowledge/data/model/article_model.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_model_article.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_model_articles.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_model_category.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart';

abstract interface class KnowledgeRemoteDatasource {
  ResultFuture<RespModelArticles> getArticles();
  ResultFuture<RespModelArticles> getBookmarks();
  ResultFuture<bool> removeBookmark(String id);
  ResultFuture<bool> setBookmark(String id);
  ResultFuture<ArticleModel> getArticle(String params);
  ResultFuture<RespModelArticles> searchArticles(String params);
  ResultFuture<RespModelCategory> getCategories();

  //Admin features
  ResultFuture<bool> createArticle(ArticleModel params);
  ResultFuture<bool> editArticle(ArticleModel params);
  ResultFuture<bool> deleteArticle(String params);
}

@Injectable(as: KnowledgeRemoteDatasource)
class KnowledgeRemoteDataSourceImpl implements KnowledgeRemoteDatasource {
  final DioCaller _dioCaller;

  KnowledgeRemoteDataSourceImpl({
    @Named(DiConst.dioNamedToken) required DioCaller dioCaller,
  }) : _dioCaller = dioCaller;
  @override
  ResultFuture<RespModelArticles> getArticles() async {
    //TODO: complete this section
    return await _dioCaller.get('api/blog',
        fromJson: RespModelArticles.fromJson);
  }

  @override
  ResultFuture<RespModelArticles> searchArticles(String params) async {
    return await _dioCaller.get(
      'api/blog/search',
      fromJson: RespModelArticles.fromJson,
      queryParameters: {'searchQuery': params},
    );
  }

  @override
  ResultFuture<bool> createArticle(ArticleModel params) {
    // TODO: implement createArticle
    throw UnimplementedError();
  }

  @override
  ResultFuture<bool> deleteArticle(String params) {
    // TODO: implement deleteArticle
    throw UnimplementedError();
  }

  @override
  ResultFuture<bool> editArticle(ArticleModel params) {
    // TODO: implement editArticle
    throw UnimplementedError();
  }

  @override
  ResultFuture<ArticleModel> getArticle(String params) async {
    return await _dioCaller.get('api/blog/$params',
        fromJson: RespModelArticle.fromJson);
  }

  @override
  ResultFuture<RespModelArticles> getBookmarks() async {
    return await _dioCaller.get(
      'api/bookmark',
      fromJson: RespModelArticles.fromJson,
    );
  }

  @override
  ResultFuture<RespModelCategory> getCategories() async {
    return await _dioCaller.get(
      'api/category',
      fromJson: RespModelCategory.fromJson,
    );
  }

  @override
  ResultFuture<bool> removeBookmark(String id) async {
    //TODO:fromjson
    return await _dioCaller.delete(
      'api/bookmark/$id',
      fromJson: RespModelCategory.fromJson,
    );
  }

  @override
  ResultFuture<bool> setBookmark(String id) async {
    //TODO:fromjson
    return await _dioCaller.post(
      'api/bookmark',
      fromJson: RespModelCategory.fromJson,
      data: {
        'blogId': id,
      },
    );
  }
}
