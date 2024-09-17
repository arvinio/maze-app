import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'crud_faq_response.freezed.dart';
part 'crud_faq_response.g.dart';

CrudFaqResponse CrudFaqResponseFromJson(String str) => CrudFaqResponse.fromJson(json.decode(str));

String CrudFaqResponseToJson(CrudFaqResponse data) => json.encode(data.toJson());

@freezed
class CrudFaqResponse with _$CrudFaqResponse {
  const factory CrudFaqResponse({
    @JsonKey(name: "success")
    bool? success,
  }) = _CrudFaqResponse;

  factory CrudFaqResponse.fromJson(Map<String, dynamic> json) => _$CrudFaqResponseFromJson(json);
}
