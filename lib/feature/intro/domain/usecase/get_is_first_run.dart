import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart';

@injectable
class GetIsFirstRun {
  final IntroRepo repo;

  GetIsFirstRun({required this.repo});

  Future<ApiResponse<Intro>> call() => repo.getIsFirstRun();
}
