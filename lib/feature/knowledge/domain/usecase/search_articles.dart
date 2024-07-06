import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class SearchArticles extends UseCaseWithParams<List<Article>, String> {
  final KnowledgeRepo repo;

  SearchArticles({required this.repo});

  @override
  ResultFuture<List<Article>> call(String params) =>
      repo.searchArticles(params);
}
