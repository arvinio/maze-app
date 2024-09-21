part of 'chat_bot_bloc.dart';

@freezed
class ChatBotEvent with _$ChatBotEvent{
  const factory ChatBotEvent.init() = _Init;
  const factory ChatBotEvent.fetchChatHistoryListEvent() = _FetchChatHistoryListEvent;
}
