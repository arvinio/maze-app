import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class GetArticles extends UseCaseWithoutParams<List<Article>> {
  final KnowledgeRepo repo;

  GetArticles({required this.repo});

  @override
  ResultFuture<List<Article>> call() => repo.getArticles();
}
