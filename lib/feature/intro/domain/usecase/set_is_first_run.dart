import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart';

@injectable
class SetIsFirstRun extends UseCaseWithoutParams<void> {
  final IntroRepo repo;

  SetIsFirstRun({required this.repo});

  @override
  ResultFuture<void> call() => repo.setIsFirstRun();

  // void call() => repo.setIsFirstRun();
}
