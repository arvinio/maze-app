part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent{
  const factory ChatEvent.init() = _Init;
  const factory ChatEvent.createChatEvent({
    required String question
  }) = _CreateChatEvent;
  const factory ChatEvent.askQuestionEvent({
    required String chatId,
    required String question
  }) = _AskQuestionEvent;
  const factory ChatEvent.regenerateEvent({
    required String chatId
  }) = _RegenerateEvent;
  const factory ChatEvent.resultChatWidgetEvent({
    required String? result,required  int? count
  }) = _ResultChatWidgetEvent;
  const factory ChatEvent.chatMessagesListEvent({
    required String? chatId,
  }) = _ChatMessagesListEvent;
}
