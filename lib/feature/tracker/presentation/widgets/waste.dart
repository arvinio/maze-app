import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/create_bin_types/presentation/view/council_landfill_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/view/create_bin_types/presentation/view/landfill_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_field.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_preview.dart';
import 'bottom_sheets/add_waste_bin_widget.dart';
import 'bottom_sheets/new_landfill_waste_bin_widget.dart';

class Waste extends StatefulWidget {
  const Waste({super.key, required this.bloc});
  final TrackerBloc bloc;

  @override
  State<Waste> createState() => _WasteState();
}

class _WasteState extends State<Waste> {
  final List<Bin> bins=[];


  @override
  void initState() {
    if(widget.bloc.hasLandfill)
    {
      bins.clear();
      bins.addAll(widget.bloc.bins.where((element) => element.type == BinType.landfill));
    }
  }
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      children: [
        !widget.bloc.hasLandfill
            ? TrackerField(
          leadingIcon: Image.asset(appAssets.landfillIcon.path),
          title: appStrings.addLandfillBinTitle,
          subTitle: appStrings.addLandfillBinSubTitle,
          horizontalTitleGap: 14,
          onTap: () {
            ShowDialog.openModalBottomSheet(
              context,
              child: AddWasteBinWidget(
                func: () {
                  ShowDialog.openModalBottomSheet(
                    context,
                    child: NewLandfillWasteBinWidget(
                      haveBin: () {
                        ShowDialog.openModalBottomSheet(
                          context,
                          child: const CouncilLandfillBinWidget().wrappedRoute(
                              context),
                        );
                      },
                      dontHaveBin:
                          () {
                        ShowDialog.openModalBottomSheet(
                            context,
                            child: const LandfillBinWidget().wrappedRoute(
                                context));
                      },
                    ),
                  );
                },
              ),
            ).then((value){
              widget.bloc.add(
                  const TrackerEvent.getBinsList());
            });
          },
        )
            : SizedBox(height:h * 0.5,
                      child: ListView.separated(
              shrinkWrap: true,
              itemCount: bins.length,
              itemBuilder: (context, index) {
                return TrackerPreview(
                  onTap: () {
                    context.pushRoute(BinDetailsPageRoute(bin: bins[index])).then((value) {
                      if(context.mounted) {
                        context.read<TrackerBloc>().add(
                            const TrackerEvent.getBinsList());
                      }
                    });
                  },
                  bin: bins[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              })),

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
