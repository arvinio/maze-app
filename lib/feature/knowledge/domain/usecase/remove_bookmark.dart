import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart';

@injectable
class RemoveBookmark extends UseCaseWithParams<bool, String> {
  final KnowledgeRepo repo;

  RemoveBookmark({required this.repo});

  @override
  ResultFuture<bool> call(String params) => repo.removeBookmark(params);
}
