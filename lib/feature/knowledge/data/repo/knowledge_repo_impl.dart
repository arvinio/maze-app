import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/knowledge/data/datasource/knowledge_remote_datasource.dart';
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
    throw UnimplementedError();
  }
}
