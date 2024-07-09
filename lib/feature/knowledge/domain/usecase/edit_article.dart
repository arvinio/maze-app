import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';

import 'package:maze_app/feature/knowledge/domain/entity/create_edit_article.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class EditArticle extends UseCaseWithParams<bool, CreateEditArticle> {
  final KnowledgeRepo repo;

  EditArticle({required this.repo});

  @override
  ResultFuture<bool> call(CreateEditArticle params) => repo.editArticle(params);
}
