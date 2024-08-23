import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/ask_question_response/ask_question_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/create_chat_response/create_chat_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/regenerate_response/regenerate_response.dart';

abstract class ChatRemoteRemoteDataSource {
  Future<ApiResponse<CreateChatResponse>> createChat({required String question});
  Future<ApiResponse<AskQuestionResponse>> askQuestion({required String chatId,required String question});
  Future<ApiResponse<RegenerateResponse>> regenerate(  {required String chatId});
  Future<ApiResponse> getChatMessagesList(  {required String chatId});

}
