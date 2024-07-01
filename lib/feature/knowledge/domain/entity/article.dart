class Article {
  final int id;
  final String text;
  final Difficulty difficulty;
  final String imageUrl;
  final String title;
  final bool isBookmark;

  const Article({
    required this.id,
    required this.text,
    required this.difficulty,
    required this.imageUrl,
    required this.title,
    required this.isBookmark,
  });
}

enum Difficulty {
  beginer,
  intermidate,
  advanced,
}
