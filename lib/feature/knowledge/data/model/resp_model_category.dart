import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:maze_app/feature/knowledge/data/model/category_model.dart';

part 'resp_model_category.freezed.dart';
part 'resp_model_category.g.dart';

@freezed
class RespModelCategory with _$RespModelCategory {
  const factory RespModelCategory({
    required bool success,
    required List<CategoryModel> result,
  }) = _RespModelCategory;

  factory RespModelCategory.fromJson(Map<String, dynamic> json) =>
      _$RespModelCategoryFromJson(json);
}
