import 'package:maze_app/core/network/model/api_response.dart';

abstract class ChatBotRemoteRemoteDataSource {
  Future<ApiResponse> getFaqList();
}
