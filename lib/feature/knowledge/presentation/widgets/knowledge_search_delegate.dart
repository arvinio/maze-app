import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_search_item.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/custom_seach_delegate.dart';

class KnowledgeSearchDelegate extends CustomSearchDelegate<String> {
  final KnowledgeCubit knowledgeCubit;
  final BuildContext context;

  KnowledgeSearchDelegate(this.knowledgeCubit, this.context);

  @override
  InputDecoration? get customDecoration {
    return InputDecoration(
      prefix: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child:
              appAssets.searchNormalIcon.svg(color: context.scheme().primary),
        ),
      ),
      suffix: InkWell(
        child: Icon(
          Icons.cancel_rounded,
          color: context.scheme().secondaryText,
        ),
        onTap: () {
          query = '';
        },
      ),
    );
  }

  @override
  InputDecorationTheme get searchFieldDecorationTheme {
    return InputDecorationTheme(
        iconColor: Colors.black,
        labelStyle: context.bodyBody,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        filled: true,
        fillColor: context.scheme().primariesShade02,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.filter_list_outlined,
          color: context.scheme().primaryText,
        ),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: context.scheme().primaryText,
      ),
      onPressed: () {
        close(context, '');
        knowledgeCubit.loadPreservedState();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Enter a search term'));
    }

    knowledgeCubit.search(query);

    return BlocBuilder<KnowledgeCubit, KnowledgeState>(
      bloc: knowledgeCubit,
      builder: (context, state) {
        if (state is SearchResultsLoaded) {
          final results = state.articles;
          if (results.isEmpty) {
            return const Center(
              child: Text("Try searching for another phrase"),
            );
          }
          return SizedBox(
            height: 800.h,
            // width: 400.w,
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) =>
                  ArticleSearchItem(article: results[index]),
            ),
          );
        } else if (state is ErrorLoadingArticles) {
          return Center(child: Text(state.error.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement suggestions based on search history or API (optional)
    return const SizedBox();
  }

  @override
  String get searchFieldLabel => 'Search Knowledge Base';
}
