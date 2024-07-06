import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_app/feature/knowledge/data/model/article_model.dart';

part 'resp_model_article.freezed.dart';
part 'resp_model_article.g.dart';

@freezed
class RespModelArticle with _$RespModelArticle {
  const factory RespModelArticle({
    required bool success,
    required List<ArticleModel> result,
  }) = _RespModelArticle;

  factory RespModelArticle.fromJson(Map<String, dynamic> json) =>
      _$RespModelArticleFromJson(json);
}
