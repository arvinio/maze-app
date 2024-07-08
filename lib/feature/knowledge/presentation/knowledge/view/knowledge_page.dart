import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';

import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';

import 'package:maze_app/core/style/app_theme.dart';

import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_post_widget.dart';

@RoutePage()
class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<KnowledgePage> createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Knowledge',
          style: context.titleTitle2,
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: appAssets.searchNormalIcon.svg(),
          ),
          IconButton.filledTonal(
            onPressed: () {
              context.read<KnowledgeCubit>().loadBookmarks();
            },
            icon: appAssets.bookmarkIcon.svg(),
          ),
          if (context.read<KnowledgeCubit>().isAdmin)
            IconButton.filledTonal(
              onPressed: () {
                context.pushRoute(AdminArticlePageRoute());
              },
              icon: appAssets.bookmarkIcon.svg(),
            ),
        ],
      ),
      child: BlocBuilder<KnowledgeCubit, KnowledgeState>(
        builder: (context, state) {
          switch (state) {
            case ArticlesLoaded loaded:
              return ListView.builder(
                itemCount: loaded.articles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: AriclePostWidget(article: loaded.articles[index]),
                    onTap: () {
                      context.read<KnowledgeCubit>().loadArticle(
                            article: loaded.articles[index],
                          );
                    },
                  );
                },
              );

            case LoadingArticles _:
              return const Center(
                child: Text('Loading'),
              );
            case ErrorLoadingArticles error:
              return Center(
                child: Text(error.error.message),
              );
            default:
              return const Center(
                child: Text('something is not right'),
              );
          }
        },
      ),
    );
  }
}
