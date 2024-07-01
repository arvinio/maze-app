import 'package:maze_app/core/util/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required int id,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(DataMap json) => _$ArticleModelFromJson(json);
}
