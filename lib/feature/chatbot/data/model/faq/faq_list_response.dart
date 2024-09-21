import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:maze_app/feature/chatbot/data/model/faq_response/faq_response.dart';

part 'faq_list_response.freezed.dart';
part 'faq_list_response.g.dart';

FaqListResponse faqListResponseFromJson(String str) => FaqListResponse.fromJson(json.decode(str));

String faqListResponseToJson(FaqListResponse data) => json.encode(data.toJson());

@freezed
class FaqListResponse with _$FaqListResponse {
  const factory FaqListResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<FaqResult>? result,
  }) = _FaqListResponse;

  factory FaqListResponse.fromJson(Map<String, dynamic> json) => _$FaqListResponseFromJson(json);
}
