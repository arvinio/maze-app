import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    @Default('') @JsonKey(name: 'error_message') String message,
    @JsonKey(name: 'error_code') String? code,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}
