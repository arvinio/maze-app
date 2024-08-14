import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/chatbot/data/model/chat_history/chat_history_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq/faq_response.dart';
import 'package:maze_app/feature/chatbot/domain/repository/chatbot_repository.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';
part 'chat_bot_bloc.freezed.dart';

@Injectable()
class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
    final CharBotRepository repository;

  ChatBotBloc(this.repository) : super(const ChatBotState()) {
    on<_Init>(_onInit);
    on<_FetchChatHistoryListEvent>(_onFetchChatHistoryListEvent);
    on<_FetchFaqListEvent>(_onFetchFaqListEvent);
  }


  _onInit(_Init event, Emitter<ChatBotState> emit) async {}


    _onFetchChatHistoryListEvent(_FetchChatHistoryListEvent event, Emitter<ChatBotState> emit) async {
      emit(state.copyWith(chatBotStatus: ChatBotStatus.loading));
      final apiResponse = await repository.getChatHistory();
      apiResponse.when(completed: (data, int? statusCode) {
        ChatHistoryResponse response = data;
        List<ChatHistoryResult>? list = response.result;
        emit(state.copyWith(chatBotStatus: ChatBotStatus.loadAllHistory,
            allFetchedHistoryList: list));
      }, error: (apiError) {
        emit(state.copyWith(chatBotStatus: ChatBotStatus.failure,
            errorMessage: apiError.message));
      });
    }

  _onFetchFaqListEvent(_FetchFaqListEvent event, Emitter<ChatBotState> emit) async {
    emit(state.copyWith(chatBotStatus: ChatBotStatus.loading));

    final apiResponse = await repository.getFaqList();
    apiResponse.when(completed: (data, int? statusCode) {
      FaqResponse response = data;
      List<FaqResult>? list = response.result;
      emit(state.copyWith(chatBotStatus: ChatBotStatus.loadAllFaq,
          allFetchedFaqList: list));
    }, error: (apiError) {
      emit(state.copyWith(chatBotStatus: ChatBotStatus.failure,
          errorMessage: apiError.message));
    });
  }
}