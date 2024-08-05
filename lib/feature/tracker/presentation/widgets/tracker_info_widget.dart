import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/tracker_page.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_item.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_item_divider.dart';

class TrackerInfoWidget extends StatelessWidget {
  const TrackerInfoWidget({
    super.key,
    required this.bloc,
  });

  final TrackerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 63.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: context.scheme().neutralsBorderDivider),
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TrackerItem(
            amount: bloc.wasteSaved,
            title: "Waste saved",
            isGrayed: !bloc.hasLandfill,
          ),
          const TrackerItemDivider(),
          TrackerItem(
            amount: bloc.compostSaved,
            title: "Compost made",
            isGrayed: !bloc.hasCompost,
          ),
          const TrackerItemDivider(),
          TrackerItem(
            amount: bloc.wasteRecycled,
            title: "Waste recycled",
            isGrayed: !bloc.hasRecycling,
          ),
        ],
      ),
    );
  }
}
