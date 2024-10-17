import 'package:flutter/material.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/data/model/search/search_response.dart';
import 'search_result_item.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.items,
  });

  final List<SearchResponse> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return SearchResultItem(searchResponse: item);
      },
      separatorBuilder: (context, index) => Divider(
        indent: 56.0,
        height: 1.0,
        color: context.scheme().dividerColor,
      ),
      itemCount: items.length,
    );
  }
}
