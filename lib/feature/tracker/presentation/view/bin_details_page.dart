import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custom_container_list.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/get_entry_type_icon.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custom_bottom_sheet.dart';

enum TimeRange { month, year, week }

@RoutePage()
class BinDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final Bin bin;
  final List<EditEntry> entries;
  final BinChartData chartData;

  const BinDetailsPage({
    super.key,
    required this.bin,
    required this.entries,
    required this.chartData,
  });
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<TrackerBloc>(), child: this);
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrackerBloc, TrackerState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loadInProgress: () {},
          binsLoaded: (bins) {},
          loadingError: (error) {},
          binDetailsLoaded: (bin, entries, chartData) {},
          navigateToAddNewEntryPage: (bin) {
            context.pushRoute(NewEntryPageRoute(bin: bin));
          },
          sortingEntries: () {
            // You can add any UI updates here while sorting is in progress
          },
        );
      },
      child: BasePageWidget(
        backgroundColor: context.scheme().neutralsFieldsTags,
        pagePaddingHorizontal: 0,
        appBar:ListTile(
          leading: const PreviousButton(),
          trailing: InkWell(child: appAssets.more.svg(),onTap: (){_showOptions(context);},),
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
              Divider(color: context.scheme().neutralsBorderDivider,thickness: 0.5,),
              Container(
                color: context.scheme().neutralsBackground,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
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
                                onTap: () {
                                  _showSortOptions(context);
                                },
                                child: appAssets.sort.svg(color: context.scheme().primaryText)
                            ),
                            const SizedBox(width: 8,),
                            InkWell(
                                onTap: () {
                                  context.read<TrackerBloc>().add(
                                      TrackerEvent.navigateToAddNewEntryPage(
                                          bin: widget.bin));
                                },
                                child: appAssets.addEntry.svg(width: 24,height: 24)
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildEntriesList(context),
                  ],),
                ),
              ),

            ],
          ),
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
                color: context.scheme().neutralsBackground,
                border: Border.all(
                    color: context.scheme().neutralsBorderDivider),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimen.defaultRadius)),
              ),
              height: 80.dg,
              width:  80.dg,
              padding: widget.bin.imageUrl != null ?EdgeInsets.zero:EdgeInsets.only(top:20.sp,left:10.sp,right:10.sp),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimen.defaultRadius)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
                child: widget.bin.imageUrl==null
              ? NoImage(fontSize: 15,color: context.scheme().disabledText)
             : Image.network(
                  widget.bin.imageUrl!,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(widget.bin.nickName, style: context.titleTitle3),
          CustomText(
            widget.bin.type.toString().split('.').last,
            style: context.footnoteFootnote.copyWith(color: context.scheme().secondaryText),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 70.h,
            width: 350.w,
            decoration: BoxDecoration(
              color: context.scheme().neutralsBackground,
              border: Border.all(color: context.scheme().neutralsBorderDivider.withOpacity(0.08),width: 1),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDetailCard(context,'${widget.bin.amountOfLiters ?? 'N/A'} ${appStrings.litres}'  ,appStrings.binSize ),
                VerticalDivider(
                  color: context.scheme().neutralsBorderDivider,
                  indent: 13.w,
                  endIndent: 13.w,
                ),
                _buildDetailCard(context, '${widget.bin.totalAmount ?? 'N/A'} ${appStrings.kg}',
                    appStrings.compostMade),
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
                  CustomText(appStrings.compostMade, style: context.footnoteFootnoteBold),
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
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _calculateMaxY(),
                minY: 0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(7, (index) {
                  double value = index < widget.chartData.chartWeek.length
                      ? widget.chartData.chartWeek[index].value.toDouble()
                      : 0;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color: value > 0
                            ? context.scheme().primary
                            : Colors.grey[300],
                        width: 30,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(4)),
                        rodStackItems: [
                          BarChartRodStackItem(0, value, Colors.transparent),
                        ],
                      ),
                    ],
                    showingTooltipIndicators: [0],
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
          ),
        ],
      ),
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

  Widget _buildEntriesList(BuildContext context) {
    var children = <Widget>[];
    for (var element in widget.entries) {
      children.add(ListTile(
        leading: GetEntryTypeIcon(entryType: element.type),
        title: CustomText(element.entryDate.day <10 ?DateFormat('d MM yyyy').format(element.entryDate):DateFormat('dd MM yyyy').format(element.entryDate),style: context.bodyBody,),
        subtitle: CustomText(element.type.toDisplayString(),style: context.footnoteFootnote.copyWith(color: context.scheme().secondaryText)),
        onTap: () {
          context
              .read<TrackerBloc>()
              .add(TrackerEvent.navigateToAddNewEntryPage(bin: widget.bin));
        },
        trailing: const AppArrow(),
      ));
    }
    return CustomContainerList(
      height: 300.h,
      children: children,
        indent:53.w, endIndent:20.w
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MenuDialogContent(
          header: appStrings.options,
          dialogHeightPercent:0.38,
          color: Colors.transparent,
          child: Column(children: [
            CustomMenuItems(title: appStrings.editDetails,leading: appAssets.editProfile.svg(),padding:const  EdgeInsets.all(5)),
            Divider(color: context.scheme().neutralsBorderDivider,indent: 45.w,endIndent: 5.w,),
            CustomMenuItems(title: appStrings.muteNotifications,leading: appAssets.mute.svg(),padding:const  EdgeInsets.all(5)),
            Divider(color: context.scheme().neutralsBorderDivider,indent: 45.w,endIndent: 5.w,),
            CustomMenuItems(title: appStrings.deleteTumbler,
              leading: appAssets.deleteBin.svg(),titleColor:context.scheme().error ,padding:const  EdgeInsets.all(5)),
          ],)
        );
      },
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          title: 'Sort Options',
          children: [
            ListTile(
              title: Text('Sort by Date (Newest First)'),
              onTap: () {
                context.read<TrackerBloc>().add(
                      TrackerEvent.sortEntries(
                        binId: widget.bin.id!,
                        sortOption: EntrySortOption.dateNewest,
                      ),
                    );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by Date (Oldest First)'),
              onTap: () {
                context.read<TrackerBloc>().add(
                      TrackerEvent.sortEntries(
                        binId: widget.bin.id!,
                        sortOption: EntrySortOption.dateOldest,
                      ),
                    );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by Type'),
              onTap: () {
                context.read<TrackerBloc>().add(
                      TrackerEvent.sortEntries(
                        binId: widget.bin.id!,
                        sortOption: EntrySortOption.type,
                      ),
                    );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  double _calculateMaxY() {
    if (widget.chartData.chartWeek.isEmpty) return 10; // Default max if no data
    double maxValue =
        widget.chartData.chartWeek.map((e) => e.value.toDouble()).reduce(max);
    return maxValue > 0
        ? maxValue * 1.2
        : 10; // Add 20% padding, or use 10 if all values are 0
  }
}
