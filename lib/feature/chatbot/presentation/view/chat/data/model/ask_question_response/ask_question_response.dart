import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ask_question_response.freezed.dart';
part 'ask_question_response.g.dart';

AskQuestionResponse askQuestionResponseFromJson(String str) => AskQuestionResponse.fromJson(json.decode(str));

String askQuestionResponseToJson(AskQuestionResponse data) => json.encode(data.toJson());

@freezed
class AskQuestionResponse with _$AskQuestionResponse {
  const factory AskQuestionResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    Result? result,
  }) = _AskQuestionResponse;

  factory AskQuestionResponse.fromJson(Map<String, dynamic> json) => _$AskQuestionResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "result")
    String? result,
    @JsonKey(name: "annotations")
    List<dynamic>? annotations,
    @JsonKey(name: "foundIn")
    String? foundIn,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
