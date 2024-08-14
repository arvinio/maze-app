import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/ask_question_response/ask_question_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/create_chat_response/create_chat_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/regenerate_response/regenerate_response.dart';

import 'chat_remote_data_source.dart';


@Injectable(as:ChatRemoteRemoteDataSource)
class ChatBotRemoteRemoteDataSourceImpl implements ChatRemoteRemoteDataSource {
  final DioCaller dioCaller;

  ChatBotRemoteRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});

  @override
  Future<ApiResponse<CreateChatResponse>> createChat({required String question}) async{
    return await dioCaller.post<CreateChatResponse>('api/chat/new', fromJson: CreateChatResponse.fromJson,
        data: {
          'question': question,
        }
    );
  }

  @override
  Future<ApiResponse<AskQuestionResponse>> askQuestion({required String chatId, required String question}) async{
    return await dioCaller.post<AskQuestionResponse>('api/chat/ask', fromJson: AskQuestionResponse.fromJson,
        data: {
          'chatId': chatId,
          'question': question,
        }
    );
  }

  @override
  Future<ApiResponse<RegenerateResponse>> regenerate({required String chatId}) async{
    return await dioCaller.post<RegenerateResponse>('api/chat/regenerate', fromJson: RegenerateResponse.fromJson,
        data: {
          'chatId': chatId,
        }
    );
  }

}