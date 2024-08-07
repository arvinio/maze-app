import 'package:maze_app/core/network/model/api_response.dart';

abstract class CharBotRepository {
  Future<ApiResponse> getChatHistory();
  Future<ApiResponse> getFaqList();
}
