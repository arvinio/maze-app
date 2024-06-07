import 'package:maze_app/core/utils/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'thing_model.freezed.dart';
part 'thing_model.g.dart';

@freezed
class ThingModel with _$ThingModel {
  const factory ThingModel({
    required int id,
    required String name,
  }) = _ThingModel;

  factory ThingModel.fromJson(DataMap json) => _$ThingModelFromJson(json);
}
