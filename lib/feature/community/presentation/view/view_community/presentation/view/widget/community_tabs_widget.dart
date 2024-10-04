import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/community_leaderboard/community_leaderboard_list_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/community_post/community_post_list_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CommunityTabsWidget extends StatefulWidget {
  const CommunityTabsWidget({
    super.key,
    required this.communityId,
  });

  final String communityId;

  @override
  State<CommunityTabsWidget> createState() => _CommunityTabsWidgetState();
}

class _CommunityTabsWidgetState extends State<CommunityTabsWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ValueNotifier tabIndexNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: context.scheme().tabBarBorderDivider,
          thickness: 1,
        ),
        ValueListenableBuilder(
          valueListenable: tabIndexNotifier,
          builder: (context, index, child) => TabBar(
            controller: _tabController,
            automaticIndicatorColorAdjustment: true,
            indicatorPadding: const EdgeInsets.all(0.0),
            labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.fill,
            dividerHeight: 1,
            dividerColor: context.scheme().tabBarBorderDivider,
            onTap: (value) {
              tabIndexNotifier.value = value;
            },
            tabs: [
              Tab(
                height: 62.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appAssets.communityPostIcon(enabled: index == 0).svg(
                          height: 24.h,
                          width: 24.h,
                        ),
                    Text(
                      appStrings.communityPost,
                      style: context.otherNavigationLabel.copyWith(
                          color: index == 0 ? context.scheme().primary : null),
                    )
                  ],
                ),
              ),
              Tab(
                height: 62.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appAssets.leaderBoardIcon(enabled: index == 1).svg(
                          height: 24.h,
                          width: 24.h,
                        ),
                    Text(
                      appStrings.leaderBoard,
                      style: context.otherNavigationLabel.copyWith(
                          color: index == 1 ? context.scheme().primary : null),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              CommunityPostListWidget(
                communityId: widget.communityId,
              ),
              CommunityLeaderboardListWidget(
                communityId: widget.communityId,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
