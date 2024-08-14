import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chat_history_response.freezed.dart';
part 'chat_history_response.g.dart';

ChatHistoryResponse chatHistoryResponseFromJson(String str) => ChatHistoryResponse.fromJson(json.decode(str));

String chatHistoryResponseToJson(ChatHistoryResponse data) => json.encode(data.toJson());

@freezed
class ChatHistoryResponse with _$ChatHistoryResponse {
  const factory ChatHistoryResponse({
    @JsonKey(name: "result")
    List<ChatHistoryResult>? result,
  }) = _ChatHistoryResponse;

  factory ChatHistoryResponse.fromJson(Map<String, dynamic> json) => _$ChatHistoryResponseFromJson(json);
}

@freezed
class ChatHistoryResult with _$ChatHistoryResult{
  const factory ChatHistoryResult({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "lastQuestion")
    String? lastQuestion,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
  }) = _ChatHistoryResult;

  factory ChatHistoryResult.fromJson(Map<String, dynamic> json) => _$ChatHistoryResultFromJson(json);
}
