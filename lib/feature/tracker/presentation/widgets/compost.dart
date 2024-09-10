import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_field.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_preview.dart';

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
            : TrackerPreview(
                onTap: () {
                  context.read<TrackerBloc>().add(
                      TrackerEvent.fetchBinDetails(binId: bloc.bins.first.id!));
                },
                bin: bloc.bins.firstWhere(
                  (element) => element.type == BinType.compost,
                )),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
