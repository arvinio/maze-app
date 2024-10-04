import 'package:flutter/material.dart';
import 'package:maze_app/core/style/app_theme.dart';

import '../../../../../../core/config/strings.dart';
import '../../../../../../core/util/date_utils.dart';
import '../../../../../../core/util/extentsion/context_ext.dart';
import '../../../../data/model/search/search_response.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.searchResponse});

  final SearchResponse searchResponse;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 16.0,
          end: 8.0,
          top: 12.0,
          bottom: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: searchResponse.user?.avatar != null
                      ? NetworkImage(
                          searchResponse.user!.avatar!,
                        )
                      : (searchResponse.avatar != null
                          ? NetworkImage(
                              searchResponse.avatar!,
                            )
                          : null),
                  backgroundColor: context.scheme().primary,
                  radius: 20.0,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        searchResponse.name ??
                            "${searchResponse.user?.firstName} ${searchResponse.user?.lastName}",
                        style: context.titleHeadline.apply(
                          color: context.scheme().primaryText,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      searchResponse.memberCount != null
                          ? Text(
                              "${searchResponse.memberCount} ${searchResponse.memberCount == 1 ? appStrings.member : appStrings.members}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.subheadlineSubheadline.apply(
                                color: context.scheme().primaryText,
                              ),
                            )
                          : RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: context.subheadlineSubheadline.apply(
                                  color: context.scheme().primaryText,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "${getDurationString(searchResponse.createdDate)} ",
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 4,
                                      color: context.scheme().primaryText,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                    baseline: TextBaseline.ideographic,
                                  ),
                                  TextSpan(
                                    text:
                                        " ${searchResponse.community?.name ?? " "}",
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: context.scheme().tertiaryText,
                  ),
                ),
              ],
            ),
            if (searchResponse.content != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(searchResponse.content!),
              ),
          ],
        ),
      ),
    );
  }
}
