import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/network/model/api_error.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/info_icon.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details_page.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom%20sheets/add_waste_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom%20sheets/council_landfill_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom%20sheets/landfill_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom%20sheets/new_landfill_waste_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

@RoutePage()
class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    context.read<TrackerBloc>().add(const TrackerEvent.getBinsList());

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(20.h),
          child: OutlinedButton.icon(
            style: ButtonStyle(
                side: WidgetStatePropertyAll(
                    BorderSide(color: context.scheme().neutralsBorderDivider))),
            onPressed: () {},
            label: const Text('need help?'),
            iconAlignment: IconAlignment.start,
            icon: appAssets.messageQuestion.svg(),
          ),
        ),
        appBar: Padding(
          padding: EdgeInsets.only(right: 13.w),
          child: AppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            title: Text(
              'Tracker',
              style: context.titleTitle2,
            ),
            actions: [
              ElevatedButton.icon(
                onPressed: null,
                label: const Text('new entry'),
                iconAlignment: IconAlignment.start,
                icon: const Icon(Icons.add_circle),
              )
            ],
          ),
        ),
        child: BlocConsumer<TrackerBloc, TrackerState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loadInProgress: () {},
              binsLoaded: (bins) {},
              loadingError: (error) {},
              binDetailsLoaded: (bin, details) {
                context.pushRoute(
                  BinDetailsPageRoute(
                    bin: bin,
                    entries: details,
                  ),
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
                  final bloc = context.read<TrackerBloc>();
                  return LayoutBuilder(builder: (context, constraints) {
                    return ListView(
                      children: [
                        (!bloc.hasLandfill && !bloc.hasCompost
                            // !bloc.hasRecycling &&
                            // !bloc.hasOrganic
                            )
                            ? ShadowTooltip(
                                message:
                                    "You must at least add a landfil bin to get started with your tracking journey.",
                                child: TrackerInfoWidget(bloc: bloc),
                              )
                            : TrackerInfoWidget(bloc: bloc),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              "Your bins",
                              style: context.titleTitle3.copyWith(
                                  color: context.scheme().primaryText),
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
                                            context.scheme().neutralsBackground,
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
                                              const ExitButton(),
                                              Center(
                                                child: CustomText(
                                                  "Options",
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
                                                                    haveBin:
                                                                        () {
                                                                      openModalBottomSheet(
                                                                        context,
                                                                        CouncilLandfillBinWidget(
                                                                            bloc:
                                                                                bloc),
                                                                      );
                                                                    },
                                                                    dontHaveBin:
                                                                        () {
                                                                      openModalBottomSheet(
                                                                          context,
                                                                          LandfillBinWidget(
                                                                              bloc: bloc));
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                        addCompostBin: () {},
                                                      ),
                                                    );
                                                  },
                                                  title: 'Add new bin',
                                                  leading:
                                                      appAssets.addBin.svg(),
                                                ),
                                                const CustomeDivider(),
                                                BottomSheetItem(
                                                  onTap: () {},
                                                  title: 'Manage bins',
                                                  leading: appAssets.trashIcon2
                                                      .svg(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.more_vert_outlined),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TrackerTabbar(
                          tabController: _tabController,
                          title1: 'Waste',
                          title2: 'Compost',
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
                binDetailsLoaded: (Bin bin, List<EditEntry> details) {
                  return const SizedBox.shrink();
                });
          },
        ));
  }

  Future<dynamic> openModalBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context.scheme().neutralsBackground,
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
