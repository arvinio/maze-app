import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_field.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_preview.dart';

import 'bottom_sheets/add_waste_bin_widget.dart';
import 'bottom_sheets/council_landfill_bin_widget.dart';
import 'bottom_sheets/landfill_bin_widget.dart';
import 'bottom_sheets/new_landfill_waste_bin_widget.dart';

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
                title: appStrings.addLandfillBinTitle,
                subTitle:appStrings.addLandfillBinSubTitle,
                horizontalTitleGap: 14,
                onTap: () {
                  ShowDialog.openModalBottomSheet(
                    context,
                    child:AddWasteBinWidget(
                      func: () {
                        ShowDialog.openModalBottomSheet(
                          context,
                          child: NewLandfillWasteBinWidget(
                            haveBin: () {
                              ShowDialog.openModalBottomSheet(
                                context,
                                child: CouncilLandfillBinWidget(
                                    bloc:
                                    bloc),
                              );
                            },
                            dontHaveBin:
                                () {
                                  ShowDialog.openModalBottomSheet(
                                  context,
                                      child: LandfillBinWidget(
                                      bloc:
                                      bloc));
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            : TrackerPreview(
                onTap: () {
                  context.read<TrackerBloc>().add(
                      TrackerEvent.fetchBinDetails(binId: bloc.bins.first.id!));
                },
                bin: bloc.bins.firstWhere(
                  (element) => element.type == BinType.landfill,
                )),
        SizedBox(
          height: 15.h,
        ),
        // !bloc.hasOrganic
        //     ? TrackerField(
        //         leadingIcon: Image.asset(
        //           appAssets.organicIcon.path,
        //           fit: BoxFit.contain,
        //         ),
        //         title: 'Add an organic waste bin',
        //         subTitle:
        //             'Store organic waste that will later be emptied intor a compost bin',
        //         onTap: () {},
        //       )
        //     : SizedBox(),
        // SizedBox(
        //   height: 15.h,
        // ),
        // !bloc.hasRecycling
        // ? TrackerField(
        //     leadingIcon: Image.asset(appAssets.recycleIcon.path),
        //     title: 'Add a recycling waste bin',
        //     subTitle:
        //         "Stores your recyclable waste before it's taken by the council or donated",
        //     onTap: () {},
        //   )
        // : SizedBox()
      ],
    );
  }


}
