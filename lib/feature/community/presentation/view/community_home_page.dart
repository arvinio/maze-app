import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/hero_tags.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/core/util/hero_flight_suttle.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/bloc/community_bloc.dart';

import 'create_community/presention/view/create_community_dialog_content.dart';
import 'create_post/presentation/view/create_post_dialog_content.dart';

@RoutePage()
class CommunityHomePage extends StatefulWidget {
  const CommunityHomePage({super.key});

  @override
  State<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends State<CommunityHomePage> {
  final _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  List<CommunityDetails>? myCommunities = [];
  List<CommunityDetails>? otherCommunities = [];
  CommunityDetails? details;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => inject<CommunityBloc>()
        ..add(const CommunityEvent.getMyCommunitiesEvent())
        ..add(const CommunityEvent.getOtherCommunitiesEvent()),
      child: BasePageWidget(
          appBarHeight: 100,
          appBar: Padding(
              padding: const EdgeInsets.only(
                  top: 70, bottom: 14, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    appStrings.community,
                    style: context.titleTitle2,
                  ),
                  SizedBox(
                    width: w * 0.3,
                  ),
                  appAssets.community.svg(width: 34, height: 34),
                  appAssets.notify.svg(width: 34, height: 34),
                  InkWell(
                    onTap: () {
                      _showCreatePost(context);
                    },
                    child: appAssets.create.svg(width: 34, height: 34),
                  ),
                ],
              )),
          child: BlocConsumer<CommunityBloc, CommunityState>(
            listener: (context, state) async {
              if (state.communityStatus.isSuccess) {
                details = state.details!.communityDetails;
              } else if (state.communityStatus.isMyCommunitySuccess) {
                myCommunities!.clear();
                myCommunities!.addAll(state.myCommunities!.details!);
              } else if (state.communityStatus.isOtherCommunitiesSuccess) {
                otherCommunities!.clear();
                otherCommunities!.addAll(state.otherCommunities!.details!);
                if (otherCommunities!.isNotEmpty) {
                  context.read<CommunityBloc>().add(
                      CommunityEvent.getCommunityDetailsEvent(
                          id: otherCommunities![0].id!));
                }
              } else if (state.communityStatus.isFailure ||
                  state.communityStatus.isMyCommunityFailure ||
                  state.communityStatus.isOtherCommunitiesFailure) {
                Fluttertoast.showToast(
                    msg: state.errorMessage!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Hero(
                      tag: HeroTags.searchCommunityPage,
                      flightShuttleBuilder: heroFlightShuttleBuilderFromWidget,
                      transitionOnUserGestures: true,
                      child: Material(
                        color: Colors.transparent,
                        child: CustomTextField.slim(
                          textEditingController: _searchController,
                          borderRadius: 18.0,
                          enabled: false,
                          onTapWithContext: (context) {
                            final renderObject =
                                context.findRenderObject() as RenderBox?;
                            final offset =
                                renderObject?.localToGlobal(Offset.zero) ??
                                    Offset.zero;
                            final size = renderObject?.size ?? Size.zero;

                            // Not to push two routes when users taps twice immidiately
                            if (!context.router.canPop()) {
                              context.router.push(SearchCommunityPageRoute(
                                buttonOffset: offset,
                                buttonSize: size,
                                buttonRadius: const Radius.circular(24.0),
                              ));
                            }
                          },
                          label: appStrings.search,
                          focusNode: _searchFocusNode,
                          labelTextColor: context.scheme().secondaryText,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: appAssets.searchNormalIcon.svg(
                              /*width: 20,height: 20,*/
                              color: context.scheme().secondaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: context.scheme().neutralsBorderDivider,
                      indent: 0,
                      endIndent: 0,
                    ),
                    const SizedBox(height: 10),
                    CustomText(appStrings.myCommunities,
                        style: context.titleTitle3
                            .copyWith(color: const Color(0xff0A0A0A))),
                    _buildMyCommunities(myCommunities),
                    const SizedBox(height: 10),
                    CustomText(appStrings.communities,
                        style: context.titleTitle3
                            .copyWith(color: const Color(0xff0A0A0A))),
                    _buildOtherCommunities(otherCommunities),
                    const SizedBox(height: 10),
                    CustomText(appStrings.streaks,
                        style: context.titleTitle3
                            .copyWith(color: const Color(0xff0A0A0A))),
                    const SizedBox(height: 20),
                    buildStreaks(context),
                    const SizedBox(height: 10),
                    CustomText(appStrings.tracking,
                        style: context.titleTitle3
                            .copyWith(color: const Color(0xff0A0A0A))),
                    const SizedBox(height: 20),
                    buildTracking(context),
                    const SizedBox(height: 20)
                  ],
                ),
              );
            },
          )),
    );
  }

  void _showCreatePost(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const CreatePostDialogContent().wrappedRoute(context);
        });

    // else toast
  }

  void _showCreateCommunity(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const CreateCommunityDialogContent();
        });

    // else toast
  }

  Widget _buildMyCommunities(List<CommunityDetails>? myCommunities) {
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                      color: const Color(0xffEDEEF0),
                      borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                      image: DecorationImage(
                          image: ExactAssetImage(
                              appAssets.createCommunityPng.path))),
                  child: Align(
                    alignment: const Alignment(2, 2),
                    child: IconButton(
                      icon: appAssets.create.svg(width: 30, height: 30),
                      onPressed: () {
                        _showCreateCommunity(context);
                      },
                    ),
                  ),
                ),
                CustomText(appStrings.create)
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: myCommunities!.length,
              itemBuilder: (BuildContext context, int index) {
                return _communityItem(
                  context: context,
                  isMyCommunity: true,
                  details: myCommunities[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherCommunities(List<CommunityDetails>? otherCommunities) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: otherCommunities!.length,
              itemBuilder: (BuildContext context, int index) {
                return _communityItem(
                  context: context,
                  isMyCommunity: false,
                  details: otherCommunities[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 15,
                );
              },
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 238,
              decoration: BoxDecoration(
                color: const Color(0xffEDEEF0),
                borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: (details != null && details!.cover != null)
                        ? NetworkImage(details!.cover!)
                        : ExactAssetImage(appAssets.communitiesBg.path)),
              ),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff0404044d).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: CustomText(
                        details != null ? details!.name! : appStrings.maze,
                        style: context.titleTitle3.copyWith(
                            color: context.scheme().neutralsBackground),
                      ),
                      subtitle: CustomText(
                        '${details != null ? details!.memberCount! : 0} Members',
                        style: context.footnoteFootnote
                            .copyWith(color: const Color(0xffF2F2F7)),
                      ),
                      trailing: Visibility(
                        visible: details != null,
                        child: SizedBox(
                            width: 74,
                            height: 36,
                            child: CustomButton.submit(
                                text: appStrings.follow,
                                borderRadius: 100,
                                onPressed: () {
                                  context.pushRoute(ViewCommunityPageRoute(
                                      communityDetails: details!));
                                })),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget _communityItem(
      {required BuildContext context,
      CommunityDetails? details,
      bool? isMyCommunity}) {
    return InkWell(
      onTap: () {
        isMyCommunity!
            ? context.pushRoute(ViewCommunityPageRoute(
                communityDetails: details, isFollowedCommunity: true))
            : context
                .read<CommunityBloc>()
                .add(CommunityEvent.getCommunityDetailsEvent(id: details!.id!));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
                color: const Color(0xffEDEEF0),
                borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                image: DecorationImage(
                    image: details!.avatar != null
                        ? NetworkImage(details!.avatar!)
                        : ExactAssetImage(appAssets.noImage.path),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
              width: 74,
              child: CustomText(
                details!.name!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: context.footnoteFootnote,
              ))
        ],
      ),
    );
  }

  Container buildStreaks(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
          border: Border.all(color: context.scheme().neutralsBorderDivider)),
      child: ListTile(
        leading: appAssets.streaks.svg(),
        title: CustomText(
          '5 Week Streak',
          style: context.titleHeadline,
        ),
        subtitle: CustomText(
          '2 more weeks till you reach your goal',
          style: context.footnoteFootnote,
        ),
      ),
    );
  }

  Container buildTracking(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
          border: Border.all(color: context.scheme().neutralsBorderDivider)),
      child: ListTile(
        leading: appAssets.tracking.svg(),
        title: CustomText(
          '120 kg Waste Saved',
          style: context.titleHeadline,
        ),
        subtitle: CustomText(
          '80 kg left to reach your goal',
          style: context.footnoteFootnote,
        ),
      ),
    );
  }
}
