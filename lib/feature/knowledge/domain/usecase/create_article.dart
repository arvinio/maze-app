import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/entity/create_edit_article.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class CreateArticle extends UseCaseWithParams<bool, CreateEditArticle> {
  final KnowledgeRepo repo;

  CreateArticle({required this.repo});

  @override
  ResultFuture<bool> call(CreateEditArticle params) =>
      repo.createArticle(params);
}
