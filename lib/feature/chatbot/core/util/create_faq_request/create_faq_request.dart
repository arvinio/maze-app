import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_faq_request.freezed.dart';


@freezed
class CreateFaqRequest with _$CreateFaqRequest {
  const factory CreateFaqRequest({
    @JsonKey(name: "question") String? question,
    @JsonKey(name: "answer") String? answer,
  }) = _CreateFaqRequest;

}