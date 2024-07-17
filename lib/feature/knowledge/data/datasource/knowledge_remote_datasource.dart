import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/knowledge/data/model/article_model.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_empty_model.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_model_article.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_model_articles.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_model_category.dart';
import 'package:maze_app/feature/knowledge/domain/entity/create_edit_article.dart';
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart';

abstract interface class KnowledgeRemoteDatasource {
  ResultFuture<RespModelArticles> getArticles(String params);
  ResultFuture<RespModelArticles> getBookmarks();
  ResultFuture<RespEmptyModel> removeBookmark(String id);
  ResultFuture<RespEmptyModel> setBookmark(String id);
  ResultFuture<RespModelArticle> getArticle(String params);
  ResultFuture<RespModelArticles> searchArticles(String params);
  ResultFuture<RespModelCategory> getCategories();

  //Admin features
  ResultFuture<RespEmptyModel> createArticle(CreateEditArticle params);
  ResultFuture<RespEmptyModel> editArticle(CreateEditArticle params);
  ResultFuture<RespEmptyModel> deleteArticle(String params);
}

@Injectable(as: KnowledgeRemoteDatasource)
class KnowledgeRemoteDataSourceImpl implements KnowledgeRemoteDatasource {
  final DioCaller _dioCaller;

  KnowledgeRemoteDataSourceImpl({
    @Named(DiConst.dioNamedToken) required DioCaller dioCaller,
  }) : _dioCaller = dioCaller;
  @override
  ResultFuture<RespModelArticles> getArticles(String params) async {
    //TODO: complete this section
    return await _dioCaller.get(
      'api/blog?filter=$params',
      fromJson: RespModelArticles.fromJson,
    );
  }

  @override
  ResultFuture<RespModelArticles> searchArticles(String params) async {
    return await _dioCaller.get(
      'api/blog/search?searchQuery=$params',
      fromJson: RespModelArticles.fromJson,
    );
  }

  @override
  ResultFuture<RespEmptyModel> createArticle(CreateEditArticle params) async {
    final data = FormData.fromMap({
      if (params.image != null)
        'cover': [
          await MultipartFile.fromFile(params.image!,
              filename: params.image?.split('/').last),
        ],
      'title': params.title,
      'content': params.text,
      'category': params.categoryID,
    });
    return await _dioCaller.post('api/blog',
        fromJson: RespEmptyModel.fromJson, data: data);
  }

  @override
  ResultFuture<RespEmptyModel> deleteArticle(String params) async {
    return await _dioCaller.delete('api/blog/$params',
        fromJson: RespEmptyModel.fromJson);
  }

  @override
  ResultFuture<RespEmptyModel> editArticle(CreateEditArticle params) async {
    final data = FormData.fromMap({
      if (params.image != null)
        'files': [
          await MultipartFile.fromFile(params.image!),
        ],
      'title': params.title,
      'content': params.text,
      if (params.categoryID != null) 'category': params.categoryID
    });
    return await _dioCaller.put('api/blog',
        fromJson: RespEmptyModel.fromJson, data: data);
  }

  @override
  ResultFuture<RespModelArticle> getArticle(String params) async {
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
  ResultFuture<RespEmptyModel> removeBookmark(String id) async {
    return await _dioCaller.delete(
      'api/bookmark/$id',
      fromJson: RespEmptyModel.fromJson,
    );
  }

  @override
  ResultFuture<RespEmptyModel> setBookmark(String id) async {
    return await _dioCaller.post(
      'api/bookmark',
      fromJson: RespEmptyModel.fromJson,
      data: {
        'blogId': id,
      },
    );
  }
}
