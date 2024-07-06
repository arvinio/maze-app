import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';

abstract interface class IntroRepo {
  ResultFuture<Intro> getIsFirstRun();
  ResultVoid setIsFirstRun();
}
