import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';

class ArticleSearchItem extends StatelessWidget {
  const ArticleSearchItem({
    super.key,
    required this.article,
    required this.function,
  });

  final Article article;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    var image = Container(
      height: 80.h,
      width: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: NetworkImage(article.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );

    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            image,
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: context.footnoteFootnote,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    article.text,
                    style: context.titleHeadline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
