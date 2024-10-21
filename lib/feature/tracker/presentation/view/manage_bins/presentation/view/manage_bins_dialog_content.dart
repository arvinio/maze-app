import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/manage_bins_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/bins_list.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/view/deleted_bins_dialog_content.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class ManageBinsDialogContent extends StatefulWidget implements AutoRouteWrapper{
  const ManageBinsDialogContent({super.key, required this.bloc});
  final TrackerBloc bloc;

  @override
  State<ManageBinsDialogContent> createState() => _ManageBinsDialogContentState();

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
              state.when(
                initial: () {},
                loadInProgress: () {
                  return loadingWidget(context);
                },
                binsLoaded: (value) {
                  bins.clear();
                  bins.addAll(value);
                },
                loadingError: (error) {
                  Fluttertoast.showToast(msg: error.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                navigateToAddNewEntryPage: (bin) {},
              );
            },
            builder: (context, state) {
              return BlocBuilder<ManageBinsBloc, ManageBinsState>(

                builder: (manageContext, manageState) {
                  if (manageState.status.isTransferSuccess) {
                    manageContext.read<ManageBinsBloc>().add(
                        const ManageBinsEvent.init());
                  }
                  else if (manageState.status.isDeleted) {
                    context.read<TrackerBloc>().add(
                        const TrackerEvent.getBinsList());

                    manageContext.read<ManageBinsBloc>().add(
                        const ManageBinsEvent.init());
                  }
                  else if (manageState.status.isDeleteFailure) {
                    Fluttertoast.showToast(
                        msg: manageState.errorMessage!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else if (manageState.status.isFailure) {
                    Fluttertoast.showToast(
                        msg: manageState.errorMessage!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
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
                      child: manageState.status.isLoading
                          ? const PageLoading()
                          : TabBarView(
                        controller: _tabController,
                        children: [
                          binsType(manageContext, bins: bins.where(
                                (element) => element.type == BinType.landfill,
                          ).toList(),
                              subtitle: appStrings.landfillWasteBin,
                              state: manageState,
                              bloc: widget.bloc),

                          binsType(manageContext, bins: bins.where(
                                (element) => element.type == BinType.compost,
                          ).toList(),
                              subtitle: appStrings.compostTumbler,
                              state: manageState,
                              bloc: widget.bloc),
                          //   compost(widget.bloc),
                        ],
                      ),
                    )

                  ],);
                },
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  void getBinsEvent() => context.read<TrackerBloc>().add(const TrackerEvent.getBinsList());
  
  SingleChildScrollView binsType(BuildContext context,
      {List<Bin>? bins, String? subtitle,required ManageBinsState state, TrackerBloc? bloc}) {
    return SingleChildScrollView(
        child: Column(
            children: [
              state.status.isLoading
              ?loadingWidget(context)
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
                            operationOnBin(context, bins[index], bins);
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
              deletedBins(context, bloc!)
            ])

    );
  }

  TrackerField deletedBins(BuildContext context, TrackerBloc bloc) {
    return TrackerField(
        title: appStrings.deletedBins,
        subTitle: appStrings.viewRecoverDeletedBins,
        onTap: () {
          ShowDialog.openModalBottomSheet(context,
            child: DeletedBinsContent(bloc: bloc).wrappedRoute(context),
          ).then((value){
            getBinsEvent();});
        });
  }

  operationOnBin(BuildContext context, Bin bin, List<Bin> bins) {
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
              CustomMenuItems(title: appStrings.transferData,
                leading: appAssets.transfer.svg(),
                trailing: appAssets.rightArrow.svg(color: context
                    .scheme()
                    .tertiaryText),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                onTap: () {
                  Future<dynamic> future = ShowDialog.openModalBottomSheet(
                      context,
                      child: BinsList(title: appStrings.transferData,
                        bins: bins,
                        titleStyle: context.titleTitle2,).wrappedRoute(context)
                  );

                  future.then((index) {
                    Navigator.of(context).pop();
                    if (context.mounted) {
                   context.read<ManageBinsBloc>().add( ManageBinsEvent.transferBinData(
                       sourceBinId: bin.id!, targetBinId: bins[index].id!));
                    }
                  });
                },
              ),
              Divider(color: context
                  .scheme()
                  .neutralsBorderDivider, indent: 45.w, endIndent: 15.w,),
              CustomMenuItems(title: appStrings.deleteBinTitle,
                subTitle: CustomText(appStrings.deleteBinSubTitle,
                    style: context.footnoteFootnote.copyWith(color: context
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
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        context.read<ManageBinsBloc>().add(
                            ManageBinsEvent.deleteBin(id: bin.id!));
                      });
                },

              )
            ],)
        );
      },
    );
  }

  loadingWidget(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.3),
      child: Center(
        child: SizedBox(
          width: 38,
          height: 38,
          child: CircularProgressIndicator(
              strokeWidth: 3.8,
              valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        ),
      ),
    );
  }
}
