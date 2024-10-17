import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/bloc/community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/bloc/view_community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_leaderboard/bloc/community_leaderboard_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_post/bloc/community_post_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/widgets/community_tabs_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/widgets/try_again_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/widgets/view_community_appbar_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/widgets/view_community_detail_widget.dart';

@RoutePage()
class ViewCommunityPage extends StatefulWidget implements AutoRouteWrapper {
  const ViewCommunityPage(
      {super.key,
      required this.communityDetails,
      this.isFollowedCommunity = false});

  final CommunityDetails communityDetails;
  final bool isFollowedCommunity;

  @override
  State<ViewCommunityPage> createState() => _ViewCommunityPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<CommunityLeaderboardBloc>()),
        BlocProvider(create: (_) => inject<CommunityPostBloc>()),
        BlocProvider(create: (_) => inject<ViewCommunityBloc>()),
        BlocProvider(create: (_) => inject<CommunityBloc>()),
      ],
      child: this,
    );
  }
}

class _ViewCommunityPageState extends State<ViewCommunityPage> {
  late CommunityDetails communityDetails;

  @override
  void initState() {
    communityDetails = widget.communityDetails;
    super.initState();
  }

  void getCommunityDetails() {
    context.read<CommunityBloc>().add(CommunityEvent.getCommunityDetailsEvent(
        id: widget.communityDetails.id!));
  }

  @override
  Widget build(BuildContext context) {
    final communityState = context.watch<CommunityBloc>().state;

    if (communityState.communityStatus == CommunityStatus.success) {
      communityDetails = communityState.details!.communityDetails!;
    } else if (communityState.communityStatus == CommunityStatus.failure) {
      return TryAgainWidget(tryAgainCallback: getCommunityDetails);
    }

    return BlocBuilder<ViewCommunityBloc, ViewCommunityState>(
      builder: (context, state) {
        if (state.viewCommunityStatus ==
            ViewCommunityStatus.deleteCommunitySuccess) {
          Fluttertoast.showToast(
              msg: appStrings.communityDeleted,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.of(context).pop();
          context.back();
        }
        if (state.viewCommunityStatus ==
                ViewCommunityStatus.deleteCommunityFailure ||
            state.viewCommunityStatus ==
                    ViewCommunityStatus.joinCommunityFailure &&
                state.errorMessage != null) {
          Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        return Scaffold(
          body: communityState.communityStatus == CommunityStatus.loading
              ? const Column(
                  children: [
                    Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  ],
                )
              : Column(
                  children: [
                    CustomScrollView(
                      shrinkWrap: true,
                      slivers: <Widget>[
                        ViewCommunityAppbarWidget(
                          cover: communityDetails.cover,
                          communityDetails: communityDetails,
                          isOwnCommunity: communityDetails.isOwner ?? false,
                          onEditedCallback: getCommunityDetails,
                        ),
                        SliverToBoxAdapter(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimen.pagePaddingHorizontal),
                          child: Column(
                            children: [
                              ViewCommunityDetailWidget(
                                communityDetails: communityDetails,
                                communityState: state,
                                isFollowedCommunity: widget.isFollowedCommunity,
                                onEditedAction: getCommunityDetails,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                    Expanded(
                        child: CommunityTabsWidget(
                      communityId: communityDetails.id!,
                    ))
                  ],
                ),
        );
      },
    );
  }
}
