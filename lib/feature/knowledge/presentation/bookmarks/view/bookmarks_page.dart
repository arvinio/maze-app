import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/presentation/bookmarks/cubit/bookmarks_cubit.dart';

import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_post_widget.dart';

@RoutePage()
class BookmarksPage extends StatefulWidget implements AutoRouteWrapper {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // return BlocProvider(create: (_) => inject<BookmarksCubit>(), child: this);
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => inject<BookmarksCubit>(), child: this),
      BlocProvider(create: (_) => inject<KnowledgeCubit>(), child: this)
    ], child: this);
  }
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Bookmarked',
          style: context.titleTitle2,
        ),
      ),
      child: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (context, state) {
          switch (state) {
            case BookmarksLoaded loaded:
              if (loaded.articles.isNotEmpty) {
                return ListView.builder(
                  itemCount: loaded.articles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        child:
                            AriclePostWidget(article: loaded.articles[index]),
                        onTap: () => context
                            .read<BookmarksCubit>()
                            .loadArticle(loaded.articles[index].id));
                  },
                );
              } else {
                return const Center(
                  child: Text("nothing bookmarked yet"),
                );
              }

            case LoadingBookmarks _:
              return const Center(
                child: Text('Loading'),
              );
            case ErrorLoadingBookmarks error:
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
