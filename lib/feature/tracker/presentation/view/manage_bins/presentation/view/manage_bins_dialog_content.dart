import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/manage_bins_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/bins_list.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/view/deleted_bins_dialog_content.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/loading.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class ManageBinsDialogContent extends StatefulWidget implements AutoRouteWrapper {
  const ManageBinsDialogContent({super.key});

  @override
  State<ManageBinsDialogContent> createState() =>
      _ManageBinsDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return

      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => inject<TrackerBloc>(), child: this),
          BlocProvider(create: (_) => inject<ManageBinsBloc>(), child: this),
        ], child: this,);
  }
}

class _ManageBinsDialogContentState extends State<ManageBinsDialogContent>  with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late BoxConstraints constraints;

  final List<Bin> bins = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    getBinsEvent();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExitButton(),
          CustomText(
            appStrings.manageBins,
            style: context.titleTitle1,
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<TrackerBloc, TrackerState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                bins.clear();
                bins.addAll(state.bins!);
              }
              else if (state.status.isFailure) {
                Fluttertoast.showToast(
                    msg: state.errorMessage!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            builder: (context, state) {
              return Column(children: [
                TrackerTabBar(
                  tabController: _tabController,
                  title1: appStrings.waste,
                  title2: appStrings.compost,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 500.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      binsType(context, bins: bins.where(
                            (element) => element.type == BinType.landfill,
                      ).toList(),
                          subtitle: appStrings.landfillWaste,
                          trackerState: state),

                      binsType(context, bins: bins.where(
                            (element) => element.type == BinType.compost,
                      ).toList(),
                          subtitle: appStrings.compostTumbler,
                          trackerState: state),
                    ],
                  ),
                )
              ]);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  void getBinsEvent() =>
      context.read<TrackerBloc>().add(const TrackerEvent.getBinsList());

  BlocConsumer binsType(BuildContext context,
      {List<
          Bin>? bins, String? subtitle, required TrackerState trackerState }) {
    return BlocConsumer<ManageBinsBloc, ManageBinsState>(

      listener: (context, state) {
        if (state.status.isTransferSuccess) {
        }
        else if (state.status.isDeleted) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          getBinsEvent();
        }
        else if (state.status.isDeleteFailure ||
            state.status.isFailure) {
          Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
            child: Column(
                children: [
                  trackerState.status.isLoading
                      ? const Loading()
                      : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bins!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return TrackerField(
                          leadingIcon: bins[index].imageUrl == null
                              ? const NoImage()
                              : Image.network(
                            bins[index].imageUrl!,
                            fit: BoxFit.cover,
                          ),
                          title: bins[index].nickName,
                          subTitle: subtitle,
                          trailing: IconButton(
                              icon: appAssets.more.svg(color: context
                                  .scheme()
                                  .tertiaryText),
                              padding: const EdgeInsets.only(left: 30),
                              onPressed: () {
                                operationOnBin(context, bins[index], bins,state);
                              }
                          ),
                          onTap: () {});
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  deletedBins(context)
                ])

        );
      },
    );
  }

  operationOnBin(BuildContext context, Bin bin, List<Bin> bins,ManageBinsState state) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return MenuDialogContent(
            header: '${appStrings.delete} ${bin.nickName}',
            dialogHeightPercent: 0.35,
            color: context
                .scheme()
                .neutralsBorderDivider,
            child: Column(children: [
              CustomMenuItems(
                  title: appStrings.transferData,
                  leading: appAssets.transfer.svg(),
                  trailing: appAssets.rightArrow.svg(color: context
                      .scheme()
                      .tertiaryText),
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  onTap: () {
                    ShowDialog.openModalBottomSheet(
                        context,
                        child: transferDataList(context, bins)
                    ).then((index) {
                      Navigator.of(context).pop();
                      if (context.mounted) {
                        context.read<ManageBinsBloc>().add(
                            ManageBinsEvent.transferBinData(
                                sourceBinId: bin.id!,
                                targetBinId: bins[index].id!));
                      }
                    });
                  }
              ),
              Divider(color: context
                  .scheme()
                  .neutralsBorderDivider,
                indent: 45.w,
                endIndent: 15.w,),
              CustomMenuItems(
                  title: appStrings.deleteBinTitle,
                  subTitle: CustomText(appStrings.deleteBinSubTitle,
                      style: context.footnoteFootnote.copyWith(
                          color: context
                              .scheme()
                              .secondaryText)),
                  leading: appAssets.manageDeleteBin.svg(),
                  trailing: appAssets.rightArrow.svg(color: context
                      .scheme()
                      .tertiaryText),
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  onTap: () {
                    ShowDialog.delete(context,
                        title: '${appStrings.deleteBinTitle}?',
                        subtitle: appStrings.deleteBinSubTitle,
                        onPressed: () {
                          if (context.mounted) {
                            context.read<ManageBinsBloc>().add(
                                ManageBinsEvent.deleteBin(id: bin.id!));
                          }
                        });
                  })
            ])
        );
      },
    );
  }

  SingleChildScrollView transferDataList(BuildContext context, List<Bin> bins) {
    return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ExitButton(),
                              CustomText(
                                appStrings.transferData,
                                style: context.titleTitle2,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: bins.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return TrackerField(
                                      leadingIcon: bins[index].imageUrl == null
                                          ? const NoImage()
                                          : Image.network(
                                        bins[index].imageUrl!,
                                        fit: BoxFit.cover,
                                      ),
                                      title: bins[index].nickName,
                                      subTitle: bins[index].type == BinType.landfill
                                          ? appStrings.landfillWasteBin
                                          : bins[index].type == BinType.compost
                                          ? appStrings.compostTumbler
                                          : '',
                                      onTap: () {
                                        Navigator.of(context).pop(index);
                                      }
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(height: 15);
                                },
                              )
                            ],
                          ),
                        ),
                      );
  }

  TrackerField deletedBins(BuildContext context) {
    return TrackerField(
        title: appStrings.deletedBins,
        subTitle: appStrings.viewRecoverDeletedBins,
        onTap: () {
          ShowDialog.openModalBottomSheet(context,
            child: DeletedBinsContent().wrappedRoute(context),
          ).then((value) {
            getBinsEvent();
            if (context.mounted) {
              context.read<ManageBinsBloc>().add(
                  const ManageBinsEvent.init());
            }
          });
        });
  }
}
