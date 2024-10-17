import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/core/util/community_leaderboard_data_request/community_leaderboard_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_leaderboard/community_leaderboard_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_leaderboard/bloc/community_leaderboard_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_leaderboard/community_leaderboard_widget.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/widgets/try_again_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';



class CommunityLeaderboardListWidget extends StatefulWidget{
  const CommunityLeaderboardListWidget({super.key , required this.communityId,});
  final String communityId;

  @override
  State<CommunityLeaderboardListWidget> createState() => _CommunityLeaderboardListWidgetState();
}

class _CommunityLeaderboardListWidgetState extends State<CommunityLeaderboardListWidget> with AutomaticKeepAliveClientMixin{
  ValueNotifier expansionNotifier = ValueNotifier(true);
  ValueNotifier<CommunityLeaderboardType> leaderboardTypeNotifier = ValueNotifier(CommunityLeaderboardType.wasteSaved);


  @override
  void initState() {
    super.initState();
    onResume();
  }

  void onResume(){
    context.read<CommunityLeaderboardBloc>().add(
        CommunityLeaderboardEvent.leaderboardList(request: CommunityLeaderboardDataRequest(
          communityId: widget.communityId,
          page: 1,
          type: leaderboardTypeNotifier.value.name,
        )));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
      Padding(
        padding:EdgeInsets.symmetric(horizontal: Dimen.pagePaddingHorizontal , vertical: 17.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                _filterLeaderboardDialog(
                    context,
                        (value){
                      Navigator.pop(context);
                      leaderboardTypeNotifier.value = value;
                      onResume();
                    }
                );
              },
              child: Row(
                children: [
                  ValueListenableBuilder(valueListenable: leaderboardTypeNotifier, builder: (context, currentLeaderboard, child) =>  Text(
                    currentLeaderboard.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Icon(Icons.arrow_drop_down_rounded , size: 34,)
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CommunityLeaderboardBloc , CommunityLeaderboardState>(builder: (context, state) {
                if(state.communityLeaderboardStatus == CommunityLeaderboardStatus.success){
                  return  body(communityLeaderboards: state.communityLeaderboards ,state: state);
                } else if(state.communityLeaderboardStatus == CommunityLeaderboardStatus.failure){
                 return TryAgainWidget(tryAgainCallback: onResume);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              
              },),
            ),
          ],
        ),
      );
  }

  Widget body({List<CommunityLeaderboard>? communityLeaderboards , required CommunityLeaderboardState state }){
    return ListView.builder(
      itemCount: communityLeaderboards?.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return CommunityLeaderboardWidget(index: index + 1 , communityLeaderboard: communityLeaderboards![index],);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;


  void _filterLeaderboardDialog(
      BuildContext context, Function(CommunityLeaderboardType value) callBack) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.leaderBoardTitle,
            dialogHeightPercent: 0.32,
            child: Column(
              children: [
                CustomMenuItems(
                  title: appStrings.wasteSaved,
                  onTap: () {
                    callBack(CommunityLeaderboardType.wasteSaved);
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.scheme().neutralsBorderDivider,
                  indent: 16,
                  endIndent: 30,
                ),
                CustomMenuItems(
                  title: appStrings.compostMade,
                  titleColor: context.scheme().error,
                  onTap: () {
                    callBack(CommunityLeaderboardType.compostMade);
                  },
                ),
              ],
            ),
          );
        });
    // else toast
  }
}



enum CommunityLeaderboardType {
  wasteSaved,
  compostMade;
}

extension Leaderboard on CommunityLeaderboardType {

  String get name {
    switch (this) {
      case CommunityLeaderboardType.wasteSaved:
        return 'wastesaved';
      case CommunityLeaderboardType.compostMade:
        return 'compostmade';
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case CommunityLeaderboardType.wasteSaved:
        return appStrings.wasteSaved;
      case CommunityLeaderboardType.compostMade:
        return appStrings.compostMade;
      default:
        return '';
    }
  }
}