import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'faq_response.freezed.dart';
part 'faq_response.g.dart';

FaqResponse faqResponseFromJson(String str) => FaqResponse.fromJson(json.decode(str));

String faqResponseToJson(FaqResponse data) => json.encode(data.toJson());

@freezed
class FaqResponse with _$FaqResponse {
  const factory FaqResponse({
    @JsonKey(name: "result")
    List<FaqResult>? result,
  }) = _FaqResponse;

  factory FaqResponse.fromJson(Map<String, dynamic> json) => _$FaqResponseFromJson(json);
}

@freezed
class FaqResult with _$FaqResult {
  const factory FaqResult({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "question")
    String? question,
    @JsonKey(name: "answer")
    String? answer,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
  }) = _FaqResult;

  factory FaqResult.fromJson(Map<String, dynamic> json) => _$FaqResultFromJson(json);
}
