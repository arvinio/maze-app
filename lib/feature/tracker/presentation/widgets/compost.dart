import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_field.dart';

class Compost extends StatelessWidget {
  const Compost({
    super.key,
    required this.bloc,
  });

  final TrackerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !bloc.hasCompost
            ? TrackerField(
                leadingIcon: Image.asset(appAssets.compostIcon.path),
                title: 'Add a landfill bin',
                subTitle:
                    'Storeswaste that will later be emptied intro your council landfill bin',
                onTap: () {},
              )
            : SizedBox(),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
