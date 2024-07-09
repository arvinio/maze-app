class CreateEditArticle {
  final String? id;
  final String text;
  final String? categoryID;
  final String? image;
  final String title;

  const CreateEditArticle({
    this.id,
    required this.text,
    this.categoryID,
    this.image,
    required this.title,
  });
}
