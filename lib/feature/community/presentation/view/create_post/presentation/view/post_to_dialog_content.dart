import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/bloc/community_bloc/community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/create_post/presentation/view/widgets/post_to_item.dart';

class PostToDialogContent extends StatefulWidget implements AutoRouteWrapper {
  const PostToDialogContent({super.key});

  @override
  State<PostToDialogContent> createState() => _PostToDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (_) => inject<CommunityBloc>()
          ..add(const CommunityEvent.getMyCommunitiesEvent()),
        child: this);
  }
}

class _PostToDialogContentState extends State<PostToDialogContent> {
  double dialogHeightPercent = 0.92;
  final _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  List<CommunityDetails> communities = [];
  List<CommunityDetails> filteredCommunities = [];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: h * dialogHeightPercent,
        child: Container(
            decoration: BoxDecoration(
                color: context.scheme().neutralsBackground,
                boxShadow: [
                  BoxShadow(
                    color: context.scheme().selectIconDropDown,
                    spreadRadius: 1,
                    blurRadius: 4,
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimen.popupRadius),
                    topRight: Radius.circular(Dimen.popupRadius))),
            child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetHeader(
                      showDivider: false,
                      title: '',
                      // icon: appAssets.close.svg(),
                      closeIcon: appAssets.close.svg(),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: CustomText(appStrings.postTo,
                            style: context.titleTitle1
                                .copyWith(color: const Color(0xff0A0A0A)))),
                    SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: CustomTextField.outline(
                                    textEditingController: _searchController,
                                    borderRadius: 100,
                                    label: appStrings.findOtherCommunities,
                                    focusNode: _searchFocusNode,
                                    labelTextColor:
                                        context.scheme().secondaryText,
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: appAssets.searchNormalIcon.svg(
                                            color: context
                                                .scheme()
                                                .secondaryText)),
                                    onEditingComplete: () {
                                      _filterCommunity();
                                    },
                                  )),
                              SizedBox(
                                  height: h * 0.65,
                                  child: BlocBuilder<CommunityBloc,
                                          CommunityState>(
                                      builder: (context, state) {
                                    if (state
                                        .communityStatus.isMyCommunityLoading) {
                                      return const PageLoading();
                                    } else if (state
                                        .communityStatus.isMyCommunitySuccess) {
                                      communities.clear();
                                      communities.addAll(
                                          state.myCommunities!.details!);
                                      return communities.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 22.0,
                                                  right: 24,
                                                  top: 15,
                                                  bottom: 0),
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                itemCount: communities.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return PostToItem(
                                                    title: communities[index]
                                                        .name!,
                                                    subtitle:
                                                        '${communities[index].memberCount} Members',
                                                    imageUrl: communities[index]
                                                        .avatar,
                                                    onTap: () {
                                                      _onSelect(context,
                                                          communities[index]);
                                                    },
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Divider(
                                                    height: 1,
                                                    thickness: 1,
                                                    color: context
                                                        .scheme()
                                                        .neutralsBorderDivider,
                                                    indent: 70,
                                                    endIndent: 5,
                                                  );
                                                },
                                              ),
                                            )
                                          : emptyListWidget();
                                    } else if (state
                                        .communityStatus.isMyCommunityFailure) {
                                      return _failureModeWidget(
                                          context, state.errorMessage);
                                    }
                                    return Container();
                                  })),
                            ],
                          )),
                    )
                  ],
                ))),
      ),
    );
  }

  _fetchUserCommunities(BuildContext context) {
    context
        .read<CommunityBloc>()
        .add(const CommunityEvent.getMyCommunitiesEvent());
  }

  void _filterCommunity() {
    if (_searchController.text.isNotEmpty) {
      var query = _searchController.text.toLowerCase();
      filteredCommunities.clear();
      filteredCommunities.addAll(communities
          .where((item) => item.name!.toLowerCase().contains(query))
          .toList());
      communities.clear();
      communities.addAll(filteredCommunities);
    } else {}
  }

  _onSelect(BuildContext context, CommunityDetails community) {
    Navigator.pop(context, community);
  }

  Expanded emptyListWidget() {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            appStrings.emptyList,
            textAlign: TextAlign.center,
            style: context.titleHeadline
                .copyWith(color: context.scheme().disabledText),
          ),
          const SizedBox(height: 28),
        ],
      ),
    ));
  }

  _failureModeWidget(BuildContext context, String? errorMessage) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              errorMessage ?? appStrings.errorFetchInformation,
              style: context.titleTitle2.copyWith(
                  color: context.scheme().primariesShade03, height: 1.3),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton.submit(
              text: appStrings.tryAgain,
              textFontSize: 15,
              horizontalPadding: 20,
              minSize: 42,
              onPressed: () {
                _fetchUserCommunities(context);
              },
              isFullWidth: false,
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
