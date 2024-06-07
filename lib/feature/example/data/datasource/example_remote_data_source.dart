import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/utils/typedef.dart';
import 'package:maze_app/feature/example/data/model/thing_model.dart';

abstract interface class ExampleRemoteDataSource {
  ResultFuture<ThingModel> doSomething();
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final DioCaller _dioCaller;

  ExampleRemoteDataSourceImpl(this._dioCaller);

  @override
  ResultFuture<ThingModel> doSomething() {
    // TODO: implement doSomething

    throw UnimplementedError();
  }
}
