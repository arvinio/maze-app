import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/intro/domain/entity/intro.dart';

abstract interface class IntroRepo {
  Future<ApiResponse<Intro>> getIsFirstRun();
  void setIsFirstRun();
}
