import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';

import '../../../../../../core/config/strings.dart';
import '../../../../../../core/style/app_theme.dart';
import '../../../../../../core/util/extentsion/context_ext.dart';
import '../../../../data/model/search/search_response.dart';
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
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = items[index];
        return SearchResultItem(searchResponse: item);
        // return ListTile(
        //   leading: CircleAvatar(
        //     backgroundImage: item.avatar != null
        //         ? NetworkImage(
        //             item.avatar!,
        //           )
        //         : null,
        //     backgroundColor: context.scheme().primary,
        //     radius: 20.0,
        //   ),
        //   contentPadding: const EdgeInsets.symmetric(
        //     horizontal: Dimen.pagePaddingHorizontal,
        //   ),
        //   onTap: () {},
        //   title: Text(
        //     item.name ?? " ",
        //     maxLines: 1,
        //     overflow: TextOverflow.ellipsis,
        //   ),
        //   subtitle: Text(
        //     "${item.memberCount} ${item.memberCount == 1 ? appStrings.member : appStrings.members}",
        //     maxLines: 2,
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // );
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
