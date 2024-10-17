import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/feature/community/data/model/search/search_response.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'search_result_list.dart';

class SearchResultSingleTab extends StatelessWidget {
  const SearchResultSingleTab({
    super.key,
    required this.title,
    required this.resultCommunities,
  });

  final String title;
  final List<SearchResponse> resultCommunities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: Dimen.pagePaddingHorizontal,
            top: 16.0,
            bottom: 8.0,
          ),
          child: Text(
            title,
            style: context.titleTitle3,
          ),
        ),
        Expanded(
          child: SearchResultList(
            items: resultCommunities,
          ),
        )
      ],
    );
  }
}
