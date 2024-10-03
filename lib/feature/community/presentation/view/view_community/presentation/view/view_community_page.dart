import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/bloc/view_community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/community_leaderboard/bloc/community_leaderboard_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/community_post/bloc/community_post_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/community_tabs_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/view_community_appbar_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/view_community_detail_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

@RoutePage()
class ViewCommunityPage extends StatefulWidget implements AutoRouteWrapper {
  const ViewCommunityPage(
      {super.key, required this.communityDetails, this.isOwnCommunity = false});

  final CommunityDetails communityDetails;
  final bool isOwnCommunity;

  @override
  State<ViewCommunityPage> createState() => _ViewCommunityPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<CommunityLeaderboardBloc>()),
        BlocProvider(create: (_) => inject<CommunityPostBloc>()),
        BlocProvider(create: (_) => inject<ViewCommunityBloc>())
      ],
      child: this,
    );
  }
}

class _ViewCommunityPageState extends State<ViewCommunityPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewCommunityBloc, ViewCommunityState>(
      builder: (context, state) {
        if (state.viewCommunityStatus ==
            ViewCommunityStatus.deleteCommunitySuccess) {
          Navigator.of(context).pop();
          context.back();
        }
        return Scaffold(
          body: Column(
            children: [
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  ViewCommunityAppbarWidget(
                    cover: widget.communityDetails.cover,
                    communityId: widget.communityDetails.id!,
                    isOwnCommunity: widget.isOwnCommunity,
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimen.pagePaddingHorizontal),
                    child: Column(
                      children: [
                        ViewCommunityDetailWidget(
                          communityDetails: widget.communityDetails,
                          communityState: state,
                          isOwnCommunity: widget.isOwnCommunity,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              Expanded(
                  child: CommunityTabsWidget(
                communityId: widget.communityDetails.id!,
              ))
            ],
          ),
        );
      },
    );
  }
}
