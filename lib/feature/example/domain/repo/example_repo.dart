import 'package:maze_app/core/utils/typedef.dart';
import 'package:maze_app/feature/example/domain/entity/thing.dart';

abstract interface class ExampleRepo {
  const ExampleRepo();

  ResultFuture<Thing> doSmth();
}
