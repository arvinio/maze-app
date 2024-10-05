import 'package:flutter/material.dart';

import '../../../../../../../../core/config/hero_tags.dart';
import '../../../../../../../../core/style/app_theme.dart';
import '../../../../../../../../core/util/extentsion/context_ext.dart';
import '../../../../../../../../core/util/hero_flight_suttle.dart';
import 'search_result_tabs.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
    required this.tabs,
    required this.searchTextField,
  });

  final List<String> tabs;
  final Widget searchTextField;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(
          height: mediaQueryData.padding.top + 8.0,
        ),
        Row(
          children: [
            const BackButton(),
            Expanded(
              child: SizedBox(
                height: 40.0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16.0),
                  child: Hero(
                    tag: HeroTags.searchCommunityPage,
                    flightShuttleBuilder: heroFlightShuttleBuilderFromWidget,
                    child: Material(
                      color: Colors.transparent,
                      child: searchTextField,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        SearchResultTabs(
          tabs: tabs,
        ),
        Container(
          height: 1.0,
          color: context.scheme().dividerColor,
        ),
      ],
    );
  }
}
