import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/knowledge/domain/entity/app_category.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class GetCategories extends UseCaseWithoutParams<List<AppCategory>> {
  final KnowledgeRepo repo;

  GetCategories({required this.repo});

  @override
  ResultFuture<List<AppCategory>> call() => repo.getCategories();
}
