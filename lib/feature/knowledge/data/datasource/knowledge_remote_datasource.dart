import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/knowledge/data/model/article_model.dart';

abstract interface class KnowledgeRemoteDatasource {
  ResultFuture<List<ArticleModel>> getArticles();
}

@Injectable(as: KnowledgeRemoteDatasource)
class KnowledgeRemoteDataSourceImpl implements KnowledgeRemoteDatasource {
  final DioCaller _dioCaller;

  KnowledgeRemoteDataSourceImpl({
    @Named(DiConst.dioNamedToken) required DioCaller dioCaller,
  }) : _dioCaller = dioCaller;
  @override
  ResultFuture<List<ArticleModel>> getArticles() async {
    //TODO: complete this section
    return await _dioCaller.get('api/blog', fromJson: ArticleModel.fromJson);
  }
}
