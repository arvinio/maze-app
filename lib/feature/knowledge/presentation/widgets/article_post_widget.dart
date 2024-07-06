import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';

class AriclePostWidget extends StatelessWidget {
  const AriclePostWidget({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 308.h,
      width: 343.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.h,
            width: 343.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(article.imageUrl),
              ),
            ),
          ),
          Text(
            article.category.name,
            style: context.footnoteFootnote,
          ),
          Text(
            article.title,
            style: context.titleHeadline,
          )
        ],
      ),
    );
  }
}
