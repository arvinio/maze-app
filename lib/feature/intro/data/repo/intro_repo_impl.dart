import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/core/util/typedef.dart';
import 'package:maze_app/feature/intro/data/datasource/intro_local_datasource.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart';

@Injectable(as: IntroRepo)
class IntroRepoImpl implements IntroRepo {
  final IntroLocalDatasource _datasource;

  IntroRepoImpl({required IntroLocalDatasource datasource})
      : _datasource = datasource;
  @override
  Future<ApiResponse<Intro>> getIsFirstRun() async {
    final result = await _datasource.getIsFirstRun();
    return ApiResponse.completed(data: Intro(isFirstRun: result));
  }

  @override
  ResultVoid setIsFirstRun() async {
    await _datasource.setIsFirstRun();
    return const ApiResponse.completed(data: null);
  }

  // @override
  // Future<void> setIsFirstRun() async {
  //   await _datasource.setIsFirstRun();
  // }
}
