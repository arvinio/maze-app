import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';

@RoutePage()
class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
