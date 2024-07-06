import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_post_widget.dart';

@RoutePage()
class ArticlePage extends StatefulWidget implements AutoRouteWrapper {
  const ArticlePage({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<KnowledgeCubit>(), child: this);
  }
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        appBar: AppBar(
          actions: [
            IconButton.filledTonal(
              onPressed: () {},
              icon: appAssets.bookmarkIcon.svg(),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            AriclePostWidget(
              article: widget.article,
            ),
            Text(
              widget.article.text,
              style: context.bodyBody,
            ),
          ],
        ));
  }
}
