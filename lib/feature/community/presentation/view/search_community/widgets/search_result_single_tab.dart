import 'package:flutter/material.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/widgets/search_result_list.dart';

import '../../../../../../core/config/dimen.dart';
import '../../../../data/model/search/search_response.dart';

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
