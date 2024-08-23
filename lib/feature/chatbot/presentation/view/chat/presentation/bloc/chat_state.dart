part of 'chat_bloc.dart';

enum ChatStatus {
  init,
  chatLoading,
  chatSuccess,
  chatFailure,
  questionLoading,
  questionSuccess,
  questionFailure,
  regenerateLoading,
  regenerateSuccess,
  regenerateFailure,
  chatMsgListSuccess,
  notifyAskQuestionValue,
  notifyResultChatValue;

  bool get isInit => this == ChatStatus.init;

  bool get isChatLoading => this == ChatStatus.chatLoading;
  bool get isChatSuccess => this == ChatStatus.chatSuccess;
  bool get isChatFailure => this == ChatStatus.chatFailure;
  bool get isQuestionLoading => this == ChatStatus.questionLoading;
  bool get isQuestionSuccess => this == ChatStatus.questionSuccess;
  bool get isQuestionFailure => this == ChatStatus.questionFailure;
  bool get isRegenerateLoading => this == ChatStatus.regenerateLoading;
  bool get isRegenerateSuccess => this == ChatStatus.regenerateSuccess;
  bool get isRegenerateFailure => this == ChatStatus.regenerateFailure;
  bool get isChatMsgListSuccess => this == ChatStatus.chatMsgListSuccess;

}



@freezed
class ChatState with _$ChatState{
  const factory ChatState({
    @Default(ChatStatus.init) ChatStatus  chatStatus,
    CreateChatResponse? chatResponse,
    AskQuestionResponse? questionResponse,
    RegenerateResponse? regenerateResponse,
    ChatMsgListResponse? chatMsgListResponse,
    String? question,
    int? count,
    String? errorMessage

  })=_ChatState;
}
