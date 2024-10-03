import 'package:flutter/material.dart';

import '../../../../../../core/style/app_theme.dart';
import '../../../../../../core/util/extentsion/context_ext.dart';

class SearchResultTabs extends StatelessWidget {
  const SearchResultTabs({super.key, required this.tabs});

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    const height = 32.0;
    const borderRadius = BorderRadius.all(
      Radius.circular(16.0),
    );
    final themeData = Theme.of(context);
    final hasTabs = tabs.length > 1;
    return hasTabs
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: TabBar(
              isScrollable: true,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              indicatorPadding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
              ),
              indicatorWeight: 0.0,
              dividerColor: themeData.scaffoldBackgroundColor,
              labelPadding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              splashBorderRadius: borderRadius,
              splashFactory: InkSplash.splashFactory,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: context.scheme().tertiaryText,
              indicator: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: context.scheme().primary,
                  width: 1.0,
                ),
                color: context.scheme().neutralsFieldsTags,
              ),
              tabs: [
                for (var tab in tabs)
                  Tab(
                    height: height,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: context.scheme().dividerColor,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                      child: Text(tab),
                    ),
                  ),
              ],
            ),
          )
        : const SizedBox();
  }
}
