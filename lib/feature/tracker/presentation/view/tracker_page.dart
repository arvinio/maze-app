import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/manage_bins_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/add_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/add_waste_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/have_compost_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/new_landfill_waste_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/do_not_have_compost_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/view/manage_bins_dialog_content.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/bins_list.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

import 'create_bin_types/presentation/view/council_landfill_bin_widget.dart';
import 'create_bin_types/presentation/view/landfill_bin_widget.dart';
import 'create_bin_types/presentation/view/new_compost_bin_widget.dart';

@RoutePage()
class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late final TrackerBloc bloc;

  @override
  void initState() {
    getBinsList();

    _tabController = TabController(length: 2, vsync: this);
    super.initState();

    bloc = context.read<TrackerBloc>();
  }

  void getBinsList() {
     context.read<TrackerBloc>().add(const TrackerEvent.getBinsList());
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBarHeight: 70,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(20.h),
        child: OutlinedButton.icon(
          style: ButtonStyle(
              side: WidgetStatePropertyAll(
                  BorderSide(color: context
                      .scheme()
                      .neutralsBorderDivider))),
          onPressed: () {
            ShowDialog.needHelpContent(context);
          },
          label: CustomText(appStrings.needHelp),
          iconAlignment: IconAlignment.start,
          icon: appAssets.messageQuestion.svg(),
        ),
      ),
      appBar: Padding(
        padding: EdgeInsets.only(right: 13.w),
        child: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: CustomText(
            appStrings.tracker,
            style: context.titleTitle2,
          ),
          actions: [
            BlocBuilder<TrackerBloc, TrackerState>(
              builder: (context, state) {
                return ElevatedButton.icon(
                    onPressed: (bloc.hasCompost || bloc.hasLandfill)
                        ? () {
                      Future<dynamic> future = openModalBottomSheet(
                          context,
                          BinsList(title: appStrings.newEntryFor, bins: bloc
                              .bins).wrappedRoute(context));

                      future.then((index) {
                        if (context.mounted) {
                          context.read<TrackerBloc>()
                              .add(TrackerEvent.navigateToAddNewEntryPage(
                              bin: bloc.bins[index]));
                          /* context.read<TrackerBloc>().add(
                          TrackerEvent.fetchBinDetails(
                              binId: bloc.bins[index].id!));*/
                        }
                      });
                    } : null,
                    label: CustomText(appStrings.newEntry,
                      style: context.subheadlineSubheadlineMedium.copyWith(
                          color: context
                              .scheme()
                              .whiteText),),
                    iconAlignment: IconAlignment.start,
                    icon: Icon(Icons.add_circle, color: context
                        .scheme()
                        .whiteText,),
                    style: ButtonStyle(
                        backgroundColor: (bloc.hasCompost || bloc.hasLandfill)
                            ? WidgetStateProperty.all(context
                            .scheme()
                            .primary)
                            : WidgetStateProperty.all(context
                            .scheme()
                            .disabledText)
                    ));
              },
            )
          ],
        ),
      ),
      child: BlocProvider(
        create: (_) =>
            inject<ManageBinsBloc>(),
        child: BlocConsumer<TrackerBloc, TrackerState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loadInProgress: () {},
              binsLoaded: (bins) {},
              loadingError: (error) {
                Fluttertoast.showToast(msg: error.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              navigateToAddNewEntryPage: (bin) {
                context.pushRoute(
                  EntryPageRoute(bin: bin),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () {
                return const SizedBox.shrink();
              },
              loadInProgress: () => const PageLoading(),
              binsLoaded: (bins) {
                return LayoutBuilder(builder: (context, constraints) {
                  return ListView(
                    children: [
                      (!bloc.hasLandfill && !bloc.hasCompost
                          // !bloc.hasRecycling &&
                          // !bloc.hasOrganic
                      )
                          ? ShadowTooltip(
                        message:
                        appStrings.tooltipMsg,
                        child: TrackerInfoWidget(bloc: bloc).wrappedRoute(context),
                      )
                          : TrackerInfoWidget(bloc: bloc).wrappedRoute(context),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            appStrings.yourBins,
                            style: context.titleTitle3
                                .copyWith(color: context
                                .scheme()
                                .primaryText),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 250.h,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20.sp),
                                      color:
                                      context
                                          .scheme()
                                          .neutralsBackground,
                                    ),
                                    child: Column(
                                      children: [
                                        // SizedBox(
                                        //   height: 20.h,
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const ExitButton(
                                                padding: EdgeInsets.only(
                                                    top: 20, left: 20)),
                                            Center(
                                              child: CustomText(
                                                appStrings.options,
                                                style: context.titleHeadline,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50.w,
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(20.sp),
                                          decoration: BoxDecoration(
                                            color: context
                                                .scheme()
                                                .neutralsBackground,
                                            border: Border.all(
                                              color: context
                                                  .scheme()
                                                  .neutralsBorderDivider,
                                            ),
                                            borderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(
                                                    Dimen.defaultRadius)),
                                          ),
                                          child: Column(
                                            children: [
                                              BottomSheetItem(
                                                onTap: () {
                                                  openModalBottomSheet(
                                                    context,
                                                    AddBinWidget(
                                                      addWasteBin: () {
                                                        openModalBottomSheet(
                                                          context,
                                                          AddWasteBinWidget(
                                                            func: () {
                                                              openModalBottomSheet(
                                                                context,
                                                                NewLandfillWasteBinWidget(
                                                                  haveBin: () {
                                                                    openModalBottomSheet(
                                                                      context,
                                                                      const CouncilLandfillBinWidget()
                                                                          .wrappedRoute(
                                                                          context),
                                                                    );
                                                                  },
                                                                  dontHaveBin:
                                                                      () {
                                                                    openModalBottomSheet(
                                                                        context,
                                                                        const LandfillBinWidget()
                                                                            .wrappedRoute(
                                                                            context));
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      addCompostBin: () {
                                                        openModalBottomSheet(
                                                            context,
                                                            HaveCompostBinWidget(
                                                              haveBinFunc: () {
                                                                openModalBottomSheet(
                                                                    context,
                                                                    const NewCompostBinWidget()
                                                                        .wrappedRoute(
                                                                        context));
                                                              },
                                                              doNotHaveBinFunc:
                                                                  () {
                                                                openModalBottomSheet(
                                                                    context,
                                                                    DoNotHaveCompostBinWidget(
                                                                        bloc:
                                                                        bloc));
                                                              },
                                                            ));
                                                      },
                                                    ),
                                                  );
                                                },
                                                title: appStrings.addNewBin,
                                                leading: appAssets.addBin.svg(),
                                              ),
                                              const CustomDivider(),
                                              MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(create: (_) =>
                                                        inject<TrackerBloc>()),
                                                    BlocProvider(create: (_) =>
                                                        inject<
                                                            ManageBinsBloc>(),
                                                    ),
                                                  ], child: BottomSheetItem(
                                                onTap: () {
                                                  ShowDialog
                                                      .openModalBottomSheet(
                                                      context,
                                                      child: ManageBinsDialogContent(
                                                          bloc: bloc)
                                                          .wrappedRoute(
                                                          context));
                                                },
                                                title: appStrings.manageBins,
                                                leading:
                                                appAssets.trashIcon2.svg(),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).then((value) {
                                getBinsList();
                              });
                            },
                            icon: const Icon(Icons.more_vert_outlined),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TrackerTabBar(
                        tabController: _tabController,
                        title1: appStrings.waste,
                        title2: appStrings.compost,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .7,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Waste(bloc: bloc),
                            Compost(bloc: bloc),
                          ],
                        ),
                      ),
                    ],
                  );
                });
              },
              loadingError: (ApiError error) {
                return BasePageWidget(
                  child: Center(
                    child: Text(error.message),
                  ),
                );
              },
              navigateToAddNewEntryPage: (_) {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> openModalBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context
          .scheme()
          .neutralsBackground,
      context: context,
      builder: (context) {
        return Container(
          height: 780.h,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimen.pagePaddingHorizontal,
          ),
          child: child,
        );
      },
    );
  }
}
