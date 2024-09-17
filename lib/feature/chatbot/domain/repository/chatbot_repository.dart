import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/chatbot/core/update_faq_request/update_faq_request.dart';
import 'package:maze_app/feature/chatbot/core/util/create_faq_request/create_faq_request.dart';
import 'package:maze_app/feature/chatbot/data/model/crud_faq/crud_faq_response.dart';

abstract class CharBotRepository {
  Future<ApiResponse> getChatHistory();
  Future<ApiResponse> getFaqList();
  Future<ApiResponse> getFaq({required String id});
  Future<ApiResponse<CrudFaqResponse>> createFaq({required CreateFaqRequest request});
  Future<ApiResponse> deleteFaq(String id);
  Future<ApiResponse<CrudFaqResponse>> updateFaq({required UpdateFaqRequest request});


}
