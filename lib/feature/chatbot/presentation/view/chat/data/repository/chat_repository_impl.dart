import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/data_source/chat_remote_data_source.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/ask_question_response/ask_question_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/create_chat_response/create_chat_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/regenerate_response/regenerate_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/domain/repository/chat_repository.dart';

@Injectable(as:ChatRepository)
class CharRepositoryImpl implements ChatRepository
{
  final ChatRemoteRemoteDataSource remoteDataSource;
  CharRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse<CreateChatResponse>> createChat({required String question}) async{
    return await remoteDataSource.createChat(question: question);
  }

  @override
  Future<ApiResponse<AskQuestionResponse>> askQuestion({required String chatId, required String question}) async{
    return await remoteDataSource.askQuestion(chatId: chatId, question: question);
  }

  @override
  Future<ApiResponse<RegenerateResponse>> regenerate({required String chatId}) async{
    return await remoteDataSource.regenerate(chatId: chatId);
  }

  @override
  Future<ApiResponse> getChatMessagesList({required String chatId}) async{
    return await remoteDataSource.getChatMessagesList(chatId: chatId);
  }
}
