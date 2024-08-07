import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/chatbot/data/data_source/chatbot_remote_data_source.dart';
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
}
