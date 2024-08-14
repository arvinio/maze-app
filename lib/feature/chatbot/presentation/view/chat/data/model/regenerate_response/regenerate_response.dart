import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'regenerate_response.freezed.dart';
part 'regenerate_response.g.dart';

RegenerateResponse regenerateResponseFromJson(String str) => RegenerateResponse.fromJson(json.decode(str));

String regenerateResponseToJson(RegenerateResponse data) => json.encode(data.toJson());

@freezed
class RegenerateResponse with _$RegenerateResponse {
  const factory RegenerateResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    Result? result,
  }) = _RegenerateResponse;

  factory RegenerateResponse.fromJson(Map<String, dynamic> json) => _$RegenerateResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "result")
    String? result,
    @JsonKey(name: "annotations")
    List<Annotation>? annotations,
    @JsonKey(name: "foundIn")
    String? foundIn,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
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
