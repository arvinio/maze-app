part of 'chat_bot_bloc.dart';


enum ChatBotStatus {
  init,
  loading,
  loadAllFaq,
  loadAllHistory,
  success,
  failure;

  bool get isInit => this == ChatBotStatus.init;

  bool get isLoading => this == ChatBotStatus.loading;
  bool get isLoadAllFaq => this == ChatBotStatus.loadAllFaq;
  bool get isLoadAllHistory => this == ChatBotStatus.loadAllHistory;
  bool get isSuccess => this == ChatBotStatus.success;
  bool get isFailure => this == ChatBotStatus.failure;

}


@freezed
class ChatBotState with _$ChatBotState{
  const factory ChatBotState({
    @Default(ChatBotStatus.init) ChatBotStatus  chatBotStatus,
    @Default([]) List<ChatHistoryResult>? allFetchedHistoryList,
    @Default([]) List<FaqResult>? allFetchedFaqList,
    ChatHistoryResponse? historyResponse,
    FaqResponse? faqResponse,
    String? errorMessage

  })=_ChatBotState;
}
