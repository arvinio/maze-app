import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/edit_community/presention/view/edit_community_dialog_content.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/bloc/view_community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/circle_avatar_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/expandble_text_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/loading_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class ViewCommunityDetailWidget extends StatefulWidget {
  const ViewCommunityDetailWidget({
    super.key,
    required this.communityDetails,
    required this.communityState,
    this.isFollowedCommunity = false,
    required this.onEditedAction,
  });

  final CommunityDetails communityDetails;
  final ViewCommunityState communityState;
  final bool isFollowedCommunity;
  final Function onEditedAction;

  @override
  State<ViewCommunityDetailWidget> createState() =>
      _ViewCommunityDetailWidgetState();
}

class _ViewCommunityDetailWidgetState extends State<ViewCommunityDetailWidget> {
  bool isFollowing = false;
  bool joinCommunityLoading = false;
  bool showLockIcon = false;

  @override
  void didUpdateWidget(covariant ViewCommunityDetailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.communityState.viewCommunityStatus !=
        widget.communityState.viewCommunityStatus) {
      _updateStateBasedOnCommunityStatus(
          widget.communityState.viewCommunityStatus);
    }
  }

  void _updateStateBasedOnCommunityStatus(ViewCommunityStatus status) {
    switch (status) {
      case ViewCommunityStatus.joinCommunitySuccess:
        isFollowing = !isFollowing;
        joinCommunityLoading = false;
        break;
      case ViewCommunityStatus.joinCommunityLoading:
        joinCommunityLoading = true;
        break;
      default:
        joinCommunityLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    isFollowing = widget.isFollowedCommunity;
    showLockIcon = (widget.isFollowedCommunity &&
        widget.communityDetails.isOwner == false);
    _updateStateBasedOnCommunityStatus(
        widget.communityState.viewCommunityStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.communityDetails.name ?? '',
                  style: context.titleTitle3,
                ),
                Row(
                  children: [
                    if (showLockIcon) appAssets.lockCircle.svg(),
                    if (showLockIcon)
                      SizedBox(
                        width: 8.w,
                      ),
                    Text(
                      '${widget.communityDetails.memberCount.toString()} ${appStrings.members}',
                      style: context.subheadlineSubheadline,
                    ),
                  ],
                )
              ],
            ),
            CircleAvatarWidget(
              url: widget.communityDetails.avatar,
              width: 48.h,
              height: 48.h,
              type: 'network',
              onTab: () {},
              placeHolder: appAssets.personPlaceHolderImage.image(),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        widget.communityDetails.isOwner == false
            ? CustomButton.outline(
                borderRadius: 16,
                minSize: 40.h,
                backgroundColor: isFollowing ? Colors.white : Color(0xff5AA700),
                textColor: Colors.white,
                textStyle: context.subheadlineSubheadlineSemibold.copyWith(
                    color:
                        isFollowing ? context.scheme().primary : Colors.white),
                text: !joinCommunityLoading
                    ? isFollowing
                        ? appStrings.following
                        : appStrings.follow
                    : '',
                icon: joinCommunityLoading
                    ? LoadingWidget(
                        mainFontColor: context.scheme().whiteText,
                      )
                    : null,
                onPressed: () {
                  if (!joinCommunityLoading) {
                    if (isFollowing) {
                      context.read<ViewCommunityBloc>().add(
                          ViewCommunityEvent.leaveCommunity(
                              id: widget.communityDetails.id ?? ''));
                    } else {
                      context.read<ViewCommunityBloc>().add(
                          ViewCommunityEvent.joinCommunity(
                              id: widget.communityDetails.id ?? ''));
                    }
                  }
                })
            : CustomButton.outline(
                text: appStrings.editCommunityProfile,
                textStyle: context.subheadlineSubheadlineSemibold.copyWith(
                  color: context.scheme().primary,
                ),
                onPressed: () {
                  _showEditCommunity();
                }),
        SizedBox(
          height: 12.h,
        ),
        ExpandableTextWidget(
          text: widget.communityDetails.description ?? '',
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }

  void _showEditCommunity() async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return EditCommunityDialogContent(
            communityDetails: widget.communityDetails,
            onEditedCallback: widget.onEditedAction,
          );
        });
  }
}
