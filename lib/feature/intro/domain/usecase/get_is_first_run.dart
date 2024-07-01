import 'package:injectable/injectable.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart';

@injectable
class GetIsFirstRun extends UseCaseWithoutParams<Intro> {
  final IntroRepo repo;

  GetIsFirstRun({required this.repo});

  @override
  ResultFuture<Intro> call() => repo.getIsFirstRun();
  // Future<ApiResponse<Intro>> call() => repo.getIsFirstRun();
}
