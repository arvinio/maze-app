import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';

abstract interface class KnowledgeRepo {
  Future<ApiResponse<List<Article>>> getArticles();
}
