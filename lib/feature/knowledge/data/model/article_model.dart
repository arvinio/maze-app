import 'package:maze_app/core/util/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_app/feature/knowledge/data/model/category_model.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel(
      {@JsonKey(name: "_id") required String id,
      required String title,
      required String content,
      required String createdDate,
      required String editedDate,
      required CategoryModel category,
      required String cover,
      required}) = _ArticleModel;

  factory ArticleModel.fromJson(DataMap json) => _$ArticleModelFromJson(json);
}
