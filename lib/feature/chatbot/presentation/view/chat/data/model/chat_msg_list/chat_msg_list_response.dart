import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chat_msg_list_response.freezed.dart';
part 'chat_msg_list_response.g.dart';

ChatMsgListResponse chatMsgListResponseFromJson(String str) => ChatMsgListResponse.fromJson(json.decode(str));

String chatMsgListResponseToJson(ChatMsgListResponse data) => json.encode(data.toJson());

@freezed
class ChatMsgListResponse with _$ChatMsgListResponse {
  const factory ChatMsgListResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<Result>? result,
  }) = _ChatMsgListResponse;

  factory ChatMsgListResponse.fromJson(Map<String, dynamic> json) => _$ChatMsgListResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "id")
    String? id,
    @JsonKey(name: "object")
    String? object,
    @JsonKey(name: "created_at")
    int? createdAt,
    @JsonKey(name: "assistant_id")
    String? assistantId,
    @JsonKey(name: "thread_id")
    String? threadId,
    @JsonKey(name: "run_id")
    String? runId,
    @JsonKey(name: "role")
    String? role,
    @JsonKey(name: "content")
    List<Content>? content,
    @JsonKey(name: "attachments")
    List<dynamic>? attachments,
    @JsonKey(name: "metadata")
    Metadata? metadata,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Content with _$Content {
  const factory Content({
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "text")
    Text? text,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@freezed
class Text with _$Text {
  const factory Text({
    @JsonKey(name: "value")
    String? value,
    @JsonKey(name: "annotations")
    List<Annotation>? annotations,
  }) = _Text;

  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
}

@freezed
class Annotation with _$Annotation {
  const factory Annotation({
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "text")
    String? text,
    @JsonKey(name: "start_index")
    int? startIndex,
    @JsonKey(name: "end_index")
    int? endIndex,
    @JsonKey(name: "file_citation")
    FileCitation? fileCitation,
  }) = _Annotation;

  factory Annotation.fromJson(Map<String, dynamic> json) => _$AnnotationFromJson(json);
}

@freezed
class FileCitation with _$FileCitation {
  const factory FileCitation({
    @JsonKey(name: "file_id")
    String? fileId,
  }) = _FileCitation;

  factory FileCitation.fromJson(Map<String, dynamic> json) => _$FileCitationFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata() = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}
