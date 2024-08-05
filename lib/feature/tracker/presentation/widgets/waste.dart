import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_field.dart';

class Waste extends StatelessWidget {
  const Waste({
    super.key,
    required this.bloc,
  });

  final TrackerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !bloc.hasLandfill
            ? TrackerField(
                leadingIcon: Image.asset(appAssets.landfillIcon.path),
                title: 'Add a landfill bin',
                subTitle:
                    'Storeswaste that will later be emptied intro your council landfill bin',
                onTap: () {},
              )
            : SizedBox(),
        SizedBox(
          height: 15.h,
        ),
        !bloc.hasOrganic
            ? TrackerField(
                leadingIcon: Image.asset(
                  appAssets.organicIcon.path,
                  fit: BoxFit.contain,
                ),
                title: 'Add an organic waste bin',
                subTitle:
                    'Store organic waste that will later be emptied intor a compost bin',
                onTap: () {},
              )
            : SizedBox(),
        SizedBox(
          height: 15.h,
        ),
        !bloc.hasRecycling
            ? TrackerField(
                leadingIcon: Image.asset(appAssets.recycleIcon.path),
                title: 'Add a recycling waste bin',
                subTitle:
                    "Stores your recyclable waste before it's taken by the council or donated",
                onTap: () {},
              )
            : SizedBox()
      ],
    );
  }
}
