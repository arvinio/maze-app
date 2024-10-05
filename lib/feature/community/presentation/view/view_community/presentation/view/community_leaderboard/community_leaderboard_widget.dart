import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/style/app_color.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/data/model/community_leaderboard/community_leaderboard_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/widget/circle_avatar_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CommunityLeaderboardWidget extends StatefulWidget {
  const CommunityLeaderboardWidget({
    super.key,
    required this.index,
    required this.communityLeaderboard,
  });

  final int index;
  final CommunityLeaderboard communityLeaderboard;

  @override
  State<CommunityLeaderboardWidget> createState() =>
      _CommunityLeaderboardWidgetState();
}

class _CommunityLeaderboardWidgetState
    extends State<CommunityLeaderboardWidget> {

  Widget _buildMedalIcon() {
    if (widget.index > 3) return SizedBox.shrink();

    Color medalColor;
    switch (widget.index) {
      case 1:
        medalColor = appColors.goldMedalColor.light; // Gold
        break;
      case 2:
        medalColor = appColors.silverMedalColor.light; // Silver
        break;
      case 3:
        medalColor = appColors.bronzeMedalColor.light; // Bronze
        break;
      default:
        return SizedBox.shrink();
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(medalColor, BlendMode.srcIn),
      child: appAssets.medalStarIcon.svg(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatarWidget(
            url: widget.communityLeaderboard.avatar,
            width: 40.h,
            height: 40.h,
            borderWidth: 1,
            placeHolder: appAssets.personPlaceHolderImage.image(),
            type: 'network',
            onTab: () {}),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: context.scheme().tabBarBorderDivider))),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.communityLeaderboard.firstName ?? ''}${widget.communityLeaderboard.lastName ?? ''}',
                    style: context.bodyBody,
                  ),
                  Text(
                    '${widget.communityLeaderboard.statistics?.values.toList()[0]}kg ${widget.communityLeaderboard.statistics?.keys.toList()[0]}',
                    style: context.footnoteFootnote,
                  )
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMedalIcon(),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 24.h,
                      width: 24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.scheme().tabBarBorderDivider,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.index.toString(),
                        style: context.subheadlineSubheadlineMedium,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ))
      ],
    );
  }
}
