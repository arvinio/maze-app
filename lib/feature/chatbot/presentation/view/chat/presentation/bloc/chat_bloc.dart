import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/ask_question_response/ask_question_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/create_chat_response/create_chat_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/model/regenerate_response/regenerate_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/domain/repository/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@Injectable()
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repository;

  ChatBloc(this.repository) : super(const ChatState()) {
    on<_Init>(_onInit);
    on<_CreateChatEvent>(_onCreateChatEvent);
    on<_AskQuestionEvent>(_onAskQuestionEvent);
    on<_RegenerateEvent>(_onRegenerateEvent);
  }


  _onInit(_Init event, Emitter<ChatState> emit) async {}


  _onCreateChatEvent(_CreateChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.chatLoading));
    final apiResponse = await repository.createChat(question: event.question);
    apiResponse.when(completed: (data, int? statusCode) {
      CreateChatResponse response = data;
      emit(state.copyWith(chatStatus: ChatStatus.chatSuccess,
          chatResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(chatStatus: ChatStatus.chatFailure,
          errorMessage: apiError.message));
    });
  }

  _onAskQuestionEvent(_AskQuestionEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.chatLoading));
    final apiResponse = await repository.askQuestion(
        question: event.question, chatId: event.chatId);
    apiResponse.when(completed: (data, int? statusCode) {
      AskQuestionResponse response = data;
      emit(state.copyWith(chatStatus: ChatStatus.questionSuccess,
          questionResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(chatStatus: ChatStatus.questionFailure,
          errorMessage: apiError.message));
    });
  }

  _onRegenerateEvent(_RegenerateEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.regenerateLoading));
    final apiResponse = await repository.regenerate(chatId: event.chatId);
    apiResponse.when(completed: (data, int? statusCode) {
      RegenerateResponse response = data;
      emit(state.copyWith(chatStatus: ChatStatus.regenerateSuccess,
          regenerateResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(chatStatus: ChatStatus.regenerateFailure,
          errorMessage: apiError.message));
    });
  }
}