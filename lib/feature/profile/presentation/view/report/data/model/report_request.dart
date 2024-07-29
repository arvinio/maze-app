import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_request.freezed.dart';


@freezed
class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    @JsonKey(name: "cover") List<File>? photos,
    @JsonKey(name: "username") String? subject,
    @JsonKey(name: "about") String? description,
  }) = _ReportRequest;

}