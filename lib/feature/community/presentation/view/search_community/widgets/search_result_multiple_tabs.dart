import 'package:flutter/material.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/widgets/search_result_list.dart';

import '../../../../data/model/search/search_response.dart';

class SearchResultMultipleTabs extends StatelessWidget {
  const SearchResultMultipleTabs({
    super.key,
    required this.searchResults,
  });

  final Map<String, List<SearchResponse>> searchResults;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for (var key in searchResults.keys)
          SearchResultList(
            items: searchResults[key]!,
          )
      ],
    );
  }
}
