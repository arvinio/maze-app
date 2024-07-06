import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_app/feature/knowledge/data/model/article_model.dart';

part 'resp_model_articles.freezed.dart';
part 'resp_model_articles.g.dart';

@freezed
class RespModelArticles with _$RespModelArticles {
  const factory RespModelArticles({
    required bool success,
    required List<ArticleModel> result,
  }) = _RespModelArticles;

  factory RespModelArticles.fromJson(Map<String, dynamic> json) =>
      _$RespModelArticlesFromJson(json);
}
