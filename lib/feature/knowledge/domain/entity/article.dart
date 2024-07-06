import 'package:maze_app/feature/knowledge/domain/entity/app_category.dart';

class Article {
  final String id;
  final String text;
  final AppCategory category;
  final String imageUrl;
  final String title;
  final bool isBookmark;

  const Article({
    required this.id,
    required this.text,
    required this.category,
    required this.imageUrl,
    required this.title,
    this.isBookmark = false,
  });
}


// enum Difficulty {
//   beginer,
//   intermidate,
//   advanced,
// }
