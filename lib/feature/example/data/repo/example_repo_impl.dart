import 'package:dartz/dartz.dart';
import 'package:maze_app/core/utils/typedef.dart';
import 'package:maze_app/feature/example/data/datasource/example_remote_data_source.dart';
import 'package:maze_app/feature/example/domain/entity/thing.dart';
import 'package:maze_app/feature/example/domain/repo/example_repo.dart';

class ExampleRepoImpl implements ExampleRepo {
  final ExampleRemoteDataSource _remoteDataSource;

  ExampleRepoImpl(this._remoteDataSource);
  @override
  ResultFuture<Thing> doSmth() async {
    final result = await _remoteDataSource.doSomething();
    return result.fold(
      Left.new,
      (response) => Right(
        Thing(some: response.id, things: response.name),
      ),
    );
  }
}
