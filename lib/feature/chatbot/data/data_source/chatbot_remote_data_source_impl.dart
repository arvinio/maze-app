import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:maze_app/feature/chatbot/data/model/chat_history/chat_history_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq/faq_response.dart';


@Injectable(as:ChatBotRemoteRemoteDataSource)
class ChatBotRemoteRemoteDataSourceImpl implements ChatBotRemoteRemoteDataSource {
  final DioCaller dioCaller;

  ChatBotRemoteRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});


  @override
  Future<ApiResponse> getChatHistory() async{
    return await dioCaller.get(
        'api/chat?page=1', fromJson: ChatHistoryResponse.fromJson);
  }

  @override
  Future<ApiResponse> getFaqList() async{
    return await dioCaller.get(
        'api/faq?page=1', fromJson: FaqResponse.fromJson);
  }
}