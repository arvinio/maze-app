import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class GetArticle extends UseCaseWithParams<Article, String> {
  final KnowledgeRepo repo;

  GetArticle({required this.repo});

  @override
  ResultFuture<Article> call(String params) => repo.getArticle(params);
}
