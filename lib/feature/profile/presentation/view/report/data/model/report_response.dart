import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'report_response.freezed.dart';
part 'report_response.g.dart';

ReportResponse reportResponseFromJson(String str) => ReportResponse.fromJson(json.decode(str));

String reportResponseToJson(ReportResponse data) => json.encode(data.toJson());

@freezed
class ReportResponse with _$ReportResponse {
  const factory ReportResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _ReportResponse;

  factory ReportResponse.fromJson(Map<String, dynamic> json) => _$ReportResponseFromJson(json);
}
