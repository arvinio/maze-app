import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';

@RoutePage()
class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key, required this.bookMarks});
  final List<Article> bookMarks;
  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
