import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/profile/presentation/view/edit_profile/presentation/bloc/community_profile_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_item.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_item_divider.dart';

class TrackerInfoWidget extends StatefulWidget implements AutoRouteWrapper {
  const TrackerInfoWidget({
    super.key,
    required this.bloc,
  });

  final TrackerBloc bloc;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) =>
    inject<CommunityProfileBloc>()
      ..add(const CommunityProfileEvent.getCommunityProfile()), child: this);
  }

  @override
  State<TrackerInfoWidget> createState() => _TrackerInfoWidgetState();
}

class _TrackerInfoWidgetState extends State<TrackerInfoWidget> {
  int? wasteSaved=0;
  int? wasteRecycled=0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityProfileBloc, CommunityProfileState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          wasteSaved=state.wasteSaved;
          wasteRecycled=state.wasteRecycled;
        } else if (state.status.isFailure) {
          Fluttertoast.showToast(
            msg: state.errorMessage!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 63.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: context
                .scheme()
                .neutralsBorderDivider),
            borderRadius: BorderRadius.all(
              Radius.circular(20.sp),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TrackerItem(
                amount: wasteSaved!,
                title: appStrings.wasteSaved,
                isGrayed: !widget.bloc.hasLandfill,
              ),
              const TrackerItemDivider(),
              TrackerItem(
                amount: widget.bloc.compostSaved,
                title: appStrings.compostMade,
                isGrayed: !widget.bloc.hasCompost,
              ),
              const TrackerItemDivider(),
              TrackerItem(
                  amount: wasteRecycled!,
                  title: appStrings.wasteRecycled,
                  isGrayed: false
                // !bloc.hasRecycling,
              ),
            ],
          ),
        );
      },
    );
  }
}