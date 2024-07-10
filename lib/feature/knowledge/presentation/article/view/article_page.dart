import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/presentation/article/cubit/article_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_post_widget.dart';

@RoutePage()
class ArticlePage extends StatefulWidget implements AutoRouteWrapper {
  const ArticlePage({
    super.key,
  });

  @override
  State<ArticlePage> createState() => _ArticlePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ArticleCubit>(), child: this);
  }
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        switch (state) {
          case ArticleLoaded article:
            final bookmark = article.article.isBookmark;
            return BasePageWidget(
                appBar: AppBar(
                  actions: [
                    IconButton.filledTonal(
                      onPressed: () {
                        context.read<ArticleCubit>().toggleBookmark(
                            bookmark: article.article.isBookmark,
                            id: article.article.id);
                      },
                      icon: appAssets.bookmarkIcon
                          .svg(color: bookmark ? Colors.green : null),
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
                      article: article.article,
                    ),
                    Text(
                      article.article.text,
                      style: context.bodyBody,
                    ),
                  ],
                ));
          case LoadingArticle _:
            return const PageLoading();
          case LoadingFailed error:
            return BasePageWidget(
              child: Center(
                child: Text(error.error.message),
              ),
            );
          default:
            return const BasePageWidget(
              child:
                  Center(child: Text('Somthing is wrong with state handling')),
            );
        }
      },
    );
  }
}
