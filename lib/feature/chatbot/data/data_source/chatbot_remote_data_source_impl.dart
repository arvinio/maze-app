import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/chatbot/core/update_faq_request/update_faq_request.dart';
import 'package:maze_app/feature/chatbot/core/util/create_faq_request/create_faq_request.dart';
import 'package:maze_app/feature/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:maze_app/feature/chatbot/data/model/chat_history/chat_history_response.dart';
import 'package:maze_app/feature/chatbot/data/model/crud_faq/crud_faq_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq/faq_list_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq_response/faq_response.dart';


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
        'api/faq?page=1', fromJson: FaqListResponse.fromJson);
  }
  @override
  Future<ApiResponse> getFaq({required String id}) async{
    return await dioCaller.get(
        'api/faq/$id', fromJson: FaqResponse.fromJson);
  }
  @override
  Future<ApiResponse<CrudFaqResponse>> createFaq({required CreateFaqRequest request}) async{
    return await dioCaller.post<CrudFaqResponse>('api/faq', fromJson: CrudFaqResponse.fromJson,
        data: {
          'question': request.question,
          'answer': request.answer
        }
    );
  }

  @override
  Future<ApiResponse> deleteFaq(String id) async{
    return await dioCaller.delete<CrudFaqResponse>('api/faq/$id', fromJson: CrudFaqResponse.fromJson    );
  }

  @override
  Future<ApiResponse<CrudFaqResponse>> updateFaq({required UpdateFaqRequest request}) async{
    return await dioCaller.put<CrudFaqResponse>('api/faq', fromJson: CrudFaqResponse.fromJson,
        data: {
          'faqId': request.id,
          'question': request.question,
          'answer': request.answer
        }
    );
  }


}