import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details/presentation/bloc/bin_details/bin_details_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details/presentation/bloc/chart/chart_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details/presentation/view/edit_bin_details/edit_bin_details_dialog_content.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details/presentation/widgets/entry_summary_list.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/manage_bins_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/loading.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

@RoutePage()
class BinDetailsPage extends StatefulWidget implements AutoRouteWrapper {
 /* final List<EditEntry> entries;*/
  final Bin bin;
  const BinDetailsPage({
    super.key,
    required this.bin,
  });
  @override
  Widget wrappedRoute(BuildContext context) {
    return  BlocProvider(create: (_) => inject<ChartBloc>(), child: this);
  }

  @override
  State<BinDetailsPage> createState() => _BinDetailsPageState();
}

class _BinDetailsPageState extends State<BinDetailsPage> {
  String selectedTimeRange = 'W';
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  );
  TimeRange _selectedTimeRange = TimeRange.week;
  BinChartData? chartData;
  bool isMuted=false;
 List<double> chartWeek=[2,5,9,4,0.5,7,6];
 List<double> chartMonth=[2,5,9,4,1,7,6,2,5,9,4,1,7,6,2,5,9,4,1,7,6,2,5,0,4,1,7,6,8,5];
 List<double> chartYear=[2,5,9,4,1,7,6,2,5,0,4,1];
  @override
  void initState() {
    super.initState();
    context.read<ChartBloc>().add(ChartEvent.getBinChartData(binId: widget.bin.id!));
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      backgroundColor: context
          .scheme()
          .neutralsFieldsTags,
      pagePaddingHorizontal: 0,
      appBar: ListTile(
          leading: const PreviousButton(),
          trailing: InkWell(child: appAssets.more.svg(), onTap: () {
            showOptions(context, widget.bin);
          },),
          contentPadding: const EdgeInsets.fromLTRB(16, 40, 16, 10)
      ),

      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildBinDetails(context),
            SizedBox(
              height: 20.h,
            ),
            _buildCompostChart(context),
            SizedBox(
              height: 20.h,
            ),
            Divider(color: context
                .scheme()
                .neutralsBorderDivider, thickness: 0.5,),
            Container(
              color: context
                  .scheme()
                  .neutralsBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 16),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        appStrings.entries,
                        style: context.titleTitle3,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: appAssets.sort.svg(color: context
                                  .scheme()
                                  .primaryText)
                          ),
                          const SizedBox(width: 8,),
                          InkWell(
                              onTap: () {
                                context.pushRoute(
                                    EntryPageRoute(bin: widget.bin));
                                /*      context.read<TrackerBloc>().add(
                                      TrackerEvent.navigateToAddNewEntryPage(
                                          bin: widget.bin));*/
                              },
                              child: appAssets.addEntry.svg(
                                  width: 24, height: 24)
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                EntrySummaryList(binId: widget.bin.id!).wrappedRoute(context),
                ],),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildBinDetails(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context
                      .scheme()
                      .neutralsBackground,
                  border: Border.all(
                      color: context
                          .scheme()
                          .neutralsBorderDivider),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimen.defaultRadius)),
                ),
                height: 80.dg,
                width: 80.dg,
                padding: widget.bin.imageUrl != null ? EdgeInsets.zero : EdgeInsets
                    .only(top: 20.sp, left: 10.sp, right: 10.sp),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimen.defaultRadius)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: widget.bin.imageUrl == null
                        ? NoImage(fontSize: 15, color: context
                        .scheme()
                        .disabledText)
                        : Image.network(
                      widget.bin.imageUrl!,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText( widget.bin.nickName, style: context.titleTitle3),
              CustomText(
                ( widget.bin.type == BinType.landfill)
                    ? appStrings.landfillWaste
                    : appStrings.compostTumbler,
                style: context.footnoteFootnote.copyWith(color: context
                    .scheme()
                    .secondaryText),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 70.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: context
                      .scheme()
                      .neutralsBackground,
                  border: Border.all(color: context
                      .scheme()
                      .neutralsBorderDivider
                      .withOpacity(0.08), width: 1),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDetailCard(context,
                        '${ widget.bin.amountOfLiters ?? '0'} ${appStrings
                            .litres}', appStrings.binSize),
                    VerticalDivider(
                      color: context
                          .scheme()
                          .neutralsBorderDivider,
                      indent: 13.w,
                      endIndent: 13.w,
                    ),
                    _buildDetailCard(context,
                        '${ '0'} ${appStrings.kg}',
                        ( widget.bin.type == BinType.landfill)
                        ?appStrings.totalSentToLandfill
                        :appStrings.compostMade
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }

  Widget _buildDetailCard(BuildContext context, String value ,String title) {
    return SizedBox(
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(value, style: context.subheadlineSubheadlineSemibold),
          SizedBox(height: 4.h),
          CustomText(
            title,
            style: context.captionCaption.copyWith(color: context.scheme().tertiaryText),
          ),
        ],
      ),
    );
  }

  Widget _buildCompostChart(BuildContext context) {
    return BlocConsumer<ChartBloc, ChartState>(
  listener: (context, state) {
    if(state.status.isSuccess)
      {
        chartData=state.chartData;

      }
    else if(state.status.isFailure)
      {
        Fluttertoast.showToast(msg: state.errorMessage!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
  },
  builder: (context, state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.scheme().neutralsBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.scheme().neutralsBorderDivider.withOpacity(0.08),width: 1),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(widget.bin.type==BinType.landfill
                  ?appStrings.sentToLandfill
                      :appStrings.compostMade
                      , style: context.footnoteFootnoteBold),
                  CustomText(
                    '7-14 January',
                    style: context.footnoteFootnote.copyWith(color: context.scheme().tertiaryText),
                  ),
              ],
              ),

              _buildDateRangeAndTimeButtons(context),

            ],
          ),
          const SizedBox(height: 20),
          state.status.isLoading
              ?const Loading()
          : (_selectedTimeRange == TimeRange.week )
          ?SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY:
                _calculateMaxY(),
                minY: 0,
                barTouchData:  BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipPadding: EdgeInsets.zero,
                  tooltipMargin: 8,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '${rod.toY.toInt()}kg',
                      TextStyle(
                        color: context.scheme().primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                     const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                  const  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          [
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                            'Sun'
                          ][value.toInt()],
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ),
                      reservedSize: 30,
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
              /*  barGroups: List.generate(7, (index) {
                  double value =chartData!=null ? index < chartData!.chartWeek.length
                      ? chartData!.chartWeek[index].value.toDouble()
                      : 0
                  :0;*/

    barGroups: List.generate(7, (index) {
      double value=chartWeek[index];
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color:context.scheme().neutralsFieldsTags,
                        width: 30,
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(8)),
                        rodStackItems: [
                          BarChartRodStackItem(0, value, Colors.transparent),
                        ],

                      ),
                    ],
                   // showingTooltipIndicators: [0],

                    groupVertically: true
                  );
                }),

            ),
          ))
              : (_selectedTimeRange == TimeRange.month ) ?
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY:
                _calculateMaxY(),
                minY: 0,
                barTouchData: BarTouchData(enabled: false,),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                 const  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 1,right: 1),
                        child: Text(
                          [
                            '1',
                            '',
                            '',
                            '',
                            '5',
                            '',
                            '',
                            '',
                            '',
                            '10',
                            '',
                            '',
                            '',
                            '',
                            '15',
                            '',
                            '',
                            '',
                            '',
                            '20',
                            ' ',
                            ' ',
                            ' ',
                            ' ',
                            '25',
                            ' ',
                            ' ',
                            ' ',
                            ' ',
                            '30'
                          ][value.toInt()],
                          style:
                          TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ),
                      reservedSize: 30,
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                /*  barGroups: List.generate(7, (index) {
                  double value =chartData!=null ? index < chartData!.chartWeek.length
                      ? chartData!.chartWeek[index].value.toDouble()
                      : 0
                  :0;*/

                barGroups: List.generate(30, (index) {
                  double value=chartMonth[index];
                  return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: value,
                          color:context.scheme().neutralsFieldsTags,
                          width: 5,
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                          rodStackItems: [
                            BarChartRodStackItem(0, value, Colors.transparent),
                          ],

                        ),
                      ],
                      groupVertically: true
                  );
                }),
                // barTouchData: BarTouchData(
                //   enabled: false,
                //   touchTooltipData: BarTouchTooltipData(
                //     // tooltipBgColor: Colors.transparent,
                //     tooltipPadding: EdgeInsets.zero,
                //     tooltipMargin: 8,
                //     getTooltipItem: (group, groupIndex, rod, rodIndex) {
                //       return BarTooltipItem(
                //         '${rod.toY.toInt()}kg',
                //         TextStyle(
                //           color: context.scheme().primaryText,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ),
            ),
          )
              :SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY:
                _calculateMaxY(),
                minY: 0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                             '8',
                            '9',
                            '10',
                            '11',
                            '12'
                          ][value.toInt()],
                          style:
                          TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ),
                      reservedSize: 30,
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                /*  barGroups: List.generate(7, (index) {
                  double value =chartData!=null ? index < chartData!.chartWeek.length
                      ? chartData!.chartWeek[index].value.toDouble()
                      : 0
                  :0;*/

                barGroups: List.generate(12, (index) {
                  double value=chartYear[index];
                  return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: value,
                          color:context.scheme().neutralsFieldsTags,
                          width: 20,
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                          rodStackItems: [
                            BarChartRodStackItem(0, value, Colors.transparent),
                          ],

                        ),
                      ],
                    //  showingTooltipIndicators: [0],

                      groupVertically: true
                  );
                }),
                // barTouchData: BarTouchData(
                //   enabled: false,
                //   touchTooltipData: BarTouchTooltipData(
                //     // tooltipBgColor: Colors.transparent,
                //     tooltipPadding: EdgeInsets.zero,
                //     tooltipMargin: 8,
                //     getTooltipItem: (group, groupIndex, rod, rodIndex) {
                //       return BarTooltipItem(
                //         '${rod.toY.toInt()}kg',
                //         TextStyle(
                //           color: context.scheme().primaryText,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ),
            ),
          )
        ],
      ),
    );
  },
);
  }

  Widget _buildDateRangeAndTimeButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: context.scheme().neutralsBorderDivider.withOpacity(0.08),width: 1),
      ),
      child: Row(
        children: [
          _buildTimeButton(context, 'W', TimeRange.week),
          _buildTimeButton(context, 'M', TimeRange.month),
          _buildTimeButton(context, 'Y', TimeRange.year),
        ],
      ),
    );
  }

  Widget _buildTimeButton(BuildContext context, String label, TimeRange range) {
    bool isSelected = _selectedTimeRange == range;
    return GestureDetector(
      onTap: () => setState(() => _selectedTimeRange = range),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? context.scheme().primariesShade02 : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: CustomText(
          label,
          style: isSelected? context.footnoteFootnoteBold.copyWith(color: context.scheme().primary):context.footnoteFootnote.copyWith(color: context.scheme().tertiaryText),
        ),
      ),
    );
  }



  void showOptions(BuildContext context,Bin bin) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => inject<ManageBinsBloc>(),),
            BlocProvider(create: (_) => inject<BinDetailsBloc>()),
          ],

          child: MenuDialogContent(
              header: appStrings.options,
              dialogHeightPercent: 0.4,
              child: Column(children: [
                CustomMenuItems(
                  title: appStrings.editDetails,
                  leading: appAssets.editProfile.svg(),
                  trailing: appAssets.rightArrow.svg(color: context
                      .scheme()
                      .tertiaryText),
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  onTap: () {
                    ShowDialog.openModalBottomSheet(
                        context,
                        child: EditBinDetailsDialogContent(bin: bin,)
                            .wrappedRoute(
                            context));
                  },
                ),
                Divider(color: context
                    .scheme()
                    .neutralsBorderDivider, indent: 55.w, endIndent: 15.w,),
                BlocConsumer<BinDetailsBloc, BinDetailsState>(
                  listener: (context, state) {
                    if (state.status.isMuted) {
                      Navigator.of(context).pop();
                      isMuted = true;
                    }
                    else if (state.status.isUnMuted) {
                      Navigator.of(context).pop();
                      isMuted = false;
                    }
                    else if (state.status.isFailureMuted ||
                        state.status.isFailureUnMuted) {
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
                    return CustomMenuItems(
                      title: appStrings.muteNotifications,
                      leading: isMuted ? appAssets.mute.svg() : appAssets.unMute
                          .svg(),
                      trailing: state.status.isLoading
                          ? const Loading()
                          : appAssets.rightArrow.svg(color: context
                          .scheme()
                          .tertiaryText),
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      onTap: () {
                        (!isMuted) ?
                        context.read<BinDetailsBloc>().add(
                            BinDetailsEvent.muteNotification(binId: bin.id!))
                            :
                        context.read<BinDetailsBloc>().add(
                            BinDetailsEvent.unMuteNotification(binId: bin.id!));
                      },
                    );
                  },
                ),
                Divider(color: context
                    .scheme()
                    .neutralsBorderDivider, indent: 55.w, endIndent: 15.w,),
                BlocConsumer<ManageBinsBloc, ManageBinsState>(
                  listener: (context, state) {
                    if (state.status.isDeleted) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  },
                  builder: (context, state) {
                    return CustomMenuItems(
                      title: '${appStrings.delete} ${bin.nickName} ',
                      leading: appAssets.deleteBin.svg(),
                      titleColor: context
                          .scheme()
                          .error,
                      trailing: appAssets.rightArrow.svg(color: context
                          .scheme()
                          .tertiaryText),
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      onTap: () {
                        ShowDialog.delete(context,
                            title: '${appStrings.deleteBinTitle}?',
                            subtitle: appStrings.deleteBinSubTitle,
                            showLoading: state.status.isLoading,
                            onPressed: () {
                              context.read<ManageBinsBloc>().add(
                                  ManageBinsEvent.deleteBin(id: bin.id!));
                            });
                      },
                    );
                  },
                )
              ])
          ),
        );
      },
    );
  }

  double _calculateMaxY() {
    if(chartData!=null) {
      if (chartData!.chartWeek.isEmpty) return 10; // Default max if no data
      double maxValue =
      chartData!.chartWeek.map((e) => e.value.toDouble()).reduce(max);
      return maxValue > 0
          ? maxValue * 1.2
          : 10; // Add 20% padding, or use 10 if all values are 0
    }
    return 10;
  }
}
enum TimeRange { month, year, week }
