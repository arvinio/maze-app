import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/chatbot/core/update_faq_request/update_faq_request.dart';
import 'package:maze_app/feature/chatbot/core/util/create_faq_request/create_faq_request.dart';
import 'package:maze_app/feature/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:maze_app/feature/chatbot/data/model/crud_faq/crud_faq_response.dart';
import 'package:maze_app/feature/chatbot/domain/repository/chatbot_repository.dart';

@Injectable(as:CharBotRepository)
class CharBotRepositoryImpl implements CharBotRepository
{
  final ChatBotRemoteRemoteDataSource remoteDataSource;
  CharBotRepositoryImpl(this.remoteDataSource);


  @override
  Future<ApiResponse> getChatHistory() async{
    return await remoteDataSource.getChatHistory();
  }

  @override
  Future<ApiResponse> getFaqList() async{
    return await remoteDataSource.getFaqList();
  }

  @override
  Future<ApiResponse> getFaq({required String id}) async{
    return await remoteDataSource.getFaq(id: id);
  }

  @override
  Future<ApiResponse<CrudFaqResponse>> createFaq({required CreateFaqRequest request}) async{
    return await remoteDataSource.createFaq(request: request);

  }

  @override
  Future<ApiResponse> deleteFaq(String id) async{
    return await remoteDataSource.deleteFaq(id);

  }

  @override
  Future<ApiResponse<CrudFaqResponse>> updateFaq({required UpdateFaqRequest request}) async{
       return await remoteDataSource.updateFaq(request: request);

    }


}
