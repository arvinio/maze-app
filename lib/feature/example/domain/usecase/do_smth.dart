import 'package:maze_app/core/usecase/usecase.dart';
import 'package:maze_app/core/utils/typedef.dart';
import 'package:maze_app/feature/example/domain/entity/thing.dart';
import 'package:maze_app/feature/example/domain/repo/example_repo.dart';

class DoSmth extends UseCaseWithoutParams {
  final ExampleRepo _repo;

  DoSmth({required ExampleRepo repo}) : _repo = repo;
  @override
  ResultFuture<Thing> call() => _repo.doSmth();
}
