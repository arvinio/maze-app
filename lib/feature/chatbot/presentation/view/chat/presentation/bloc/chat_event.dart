part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent{
  const factory ChatEvent.init() = _Init;
  const factory ChatEvent.createChatWidgetEvent({required String? question,required  int? count}) = _CreateChatWidgetEvent;
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
}
