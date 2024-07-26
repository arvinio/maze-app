import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';

import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';

import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';

import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_post_widget.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_search_item.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/custom_seach_delegate.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/knowledge_search_delegate.dart';

@RoutePage()
class KnowledgePage extends StatefulWidget implements AutoRouteWrapper {
  const KnowledgePage({super.key});

  @override
  State<KnowledgePage> createState() => _KnowledgePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<KnowledgeCubit>(), child: this);
  }
}

class _KnowledgePageState extends State<KnowledgePage> {
  int _selectedIndex = -1;
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
            onPressed: () {
              final knowledgeCubit = context.read<KnowledgeCubit>();
              customShowSearch(
                context: context,
                delegate: KnowledgeSearchDelegate(knowledgeCubit, context),
              );
            },
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
              icon: const Icon(Icons.add),
            ),
        ],
      ),
      child: BlocBuilder<KnowledgeCubit, KnowledgeState>(
        builder: (context, state) {
          switch (state) {
            case ArticlesLoaded loaded:
              return LayoutBuilder(builder: (context, constraints) {
                final maxH = constraints.maxHeight;
                return Column(
                  children: [
                    SizedBox(
                      height: maxH * .078,
                      child: ListView.builder(
                        itemCount: loaded.categories.length,
                        itemBuilder: (context, index) {
                          return categoryChip(context, index, loaded);
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: maxH * .92,
                      child: ListView.builder(
                        itemCount: loaded.articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              child: AriclePostWidget(
                                  article: loaded.articles[index]),
                              onTap: () => context
                                  .read<KnowledgeCubit>()
                                  .loadArticle(loaded.articles[index].id));
                        },
                      ),
                    ),
                  ],
                );
              });

            case LoadingArticles _:
              return const PageLoading();
            case ErrorLoadingArticles error:
              return BasePageWidget(
                child: Center(
                  child: Text(error.error.message),
                ),
              );
            default:
              return const BasePageWidget(
                child: Center(
                  child: Text('something is not right'),
                ),
              );
          }
        },
      ),
    );
  }

  Container categoryChip(
      BuildContext context, int index, ArticlesLoaded loaded) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: FilterChip(
        showCheckmark: false,
        labelStyle: context.subheadlineSubheadline,
        selectedColor: context.scheme().primariesShade02,
        selected: _selectedIndex == index ? true : false,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _selectedIndex == index
                ? context.scheme().primary
                : context.scheme().neutralsBorderDivider,
          ),
          borderRadius: BorderRadius.circular(20.w),
        ),
        label: Text(
          loaded.categories[index].name[0].toUpperCase() +
              loaded.categories[index].name.substring(1),
          style: context.subheadlineSubheadline.copyWith(
              color: _selectedIndex == index
                  ? context.scheme().primary
                  : context.scheme().tertiaryText),
        ),
        onSelected: (value) {
          context
              .read<KnowledgeCubit>()
              .loadArticles(filter: loaded.categories[index].name);
          setState(() {
            if (value) {
              _selectedIndex = index;
            } else {
              _selectedIndex = -1;
            }
          });
        },
      ),
    );
  }
}
