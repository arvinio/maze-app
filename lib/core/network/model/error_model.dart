import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'error_model.freezed.dart';
part 'error_model.g.dart';


ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    @JsonKey(name: "message")
    List<Message>? message,
    @JsonKey(name: "error")
    String? error,
    @JsonKey(name: "statusCode")
    int? statusCode,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    @JsonKey(name: "field")
    String? field,
    @JsonKey(name: "error")
    String? error,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

/*

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    @Default('') @JsonKey(name: 'error_message') String message,
    @JsonKey(name: 'error_code') String? code,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}
*/
