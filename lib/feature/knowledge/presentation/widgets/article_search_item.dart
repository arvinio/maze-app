import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';

class ArticleSearchItem extends StatelessWidget {
  const ArticleSearchItem({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    var image = SizedBox(
      height: 80.h,
      width: 80.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
            article.imageUrl,
          ),
        ),
      ),
    );
    return SizedBox(
      height: 80.h,
      width: 343.w,
      child: ListTile(
        leading: image,
        title: Text(
          article.title,
          style: context.footnoteFootnote,
        ),
        subtitle: Text(
          article.text,
          style: context.titleHeadline,
        ),
      ),
    );
  }
}
