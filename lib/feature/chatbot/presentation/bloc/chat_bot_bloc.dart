import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
    on<_FetchFaqListEvent>(_onFetchFaqListEvent);
  }


  _onInit(_Init event, Emitter<ChatBotState> emit) async {}

  _onFetchFaqListEvent(ChatBotEvent event, Emitter<ChatBotState> emit) async {
    emit(state.copyWith(chatBotStatus: ChatBotStatus.loading));

    final apiResponse = await repository.getFaqList();
    apiResponse.when(completed: (data, int? statusCode) {
      FaqResponse response = data;
      List<Result>? list = response.result;
      emit(state.copyWith(chatBotStatus: ChatBotStatus.loadAllFaq,
          allFetchedFaqList: list));
    }, error: (apiError) {
      emit(state.copyWith(chatBotStatus: ChatBotStatus.failure,
          errorMessage: apiError.message));
    });
  }
}