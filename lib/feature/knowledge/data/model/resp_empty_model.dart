import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_app/feature/knowledge/data/model/article_model.dart';

part 'resp_empty_model.freezed.dart';
part 'resp_empty_model.g.dart';

@freezed
class RespEmptyModel with _$RespEmptyModel {
  const factory RespEmptyModel({
    required bool success,
  }) = _RespEmptyModel;

  factory RespEmptyModel.fromJson(Map<String, dynamic> json) =>
      _$RespEmptyModelFromJson(json);
}
