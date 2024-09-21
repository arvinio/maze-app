import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_faq_request.freezed.dart';


@freezed
class UpdateFaqRequest with _$UpdateFaqRequest {
  const factory UpdateFaqRequest({
    @JsonKey(name: "faqId") String? id,
    @JsonKey(name: "question") String? question,
    @JsonKey(name: "answer") String? answer,
  }) = _UpdateFaqRequest;

}