import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'faq_response.freezed.dart';
part 'faq_response.g.dart';

FaqResponse faqResponseFromJson(String str) => FaqResponse.fromJson(json.decode(str));

String faqResponseToJson(FaqResponse data) => json.encode(data.toJson());

@freezed
class FaqResponse with _$FaqResponse {
  const factory FaqResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<Result>? result,
  }) = _FaqResponse;

  factory FaqResponse.fromJson(Map<String, dynamic> json) => _$FaqResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "question")
    String? question,
    @JsonKey(name: "answer")
    String? answer,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
