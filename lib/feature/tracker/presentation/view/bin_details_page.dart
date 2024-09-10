import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custom_container_list.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custome_items.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/get_entry_type_icon.dart';
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
        backgroundColor: context.scheme().neutralsBackground,
        appBar: AppBar(
          title: Text(widget.bin.nickName),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                _showOptions(context);
              },
            ),
          ],
        ),
        child: ListView(
          children: [
            _buildBinDetails(context),
            SizedBox(
              height: 20.h,
            ),
            _buildCompostChart(context),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Entries',
                  style: context.titleTitle3,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _showSortOptions(context);
                      },
                      icon: Icon(
                        Icons.sort,
                        color: context.scheme().primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TrackerBloc>().add(
                            TrackerEvent.navigateToAddNewEntryPage(
                                bin: widget.bin));
                      },
                      icon: Icon(
                        Icons.add_circle_outlined,
                        color: context.scheme().primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _buildEntriesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBinDetails(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 80.dg,
          width: 80.dg,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: Image.network(
                widget.bin.imageUrl ?? '',
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(widget.bin.nickName, style: context.titleTitle3),
        Text(
          widget.bin.type.toString().split('.').last,
          style: context.footnoteFootnote,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 70.h,
          width: 350.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: context.scheme().neutralsBorderDivider),
            borderRadius:
                const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDetailCard(context, 'Bin size',
                  '${widget.bin.amountOfLiters ?? 'N/A'} Litres'),
              VerticalDivider(
                color: context.scheme().neutralsBorderDivider,
                indent: 10.w,
                endIndent: 10.w,
              ),
              _buildDetailCard(context, '${widget.bin.totalAmount ?? 'N/A'} kg',
                  'Total sent to landfill'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailCard(BuildContext context, String title, String value) {
    return SizedBox(
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: context.subheadlineSubheadline),
          SizedBox(height: 4.w),
          Text(
            value,
            style: context.captionCaption,
          ),
        ],
      ),
    );
  }

  Widget _buildCompostChart(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Waste Saved', style: context.titleHeadline),
              _buildDateRangeAndTimeButtons(context),
            ],
          ),
          SizedBox(height: 20),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Date Range',
          style: context.titleHeadline,
        ),
        Container(
          decoration: BoxDecoration(
            color: context.scheme().neutralsBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              _buildTimeButton(context, 'M', TimeRange.month),
              _buildTimeButton(context, 'Y', TimeRange.year),
              _buildTimeButton(context, 'W', TimeRange.week),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeButton(BuildContext context, String label, TimeRange range) {
    bool isSelected = _selectedTimeRange == range;
    return GestureDetector(
      onTap: () => setState(() => _selectedTimeRange = range),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? context.scheme().primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : context.scheme().primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildEntriesList(BuildContext context) {
    var children = <Widget>[];
    for (var element in widget.entries) {
      children.add(ListTile(
        leading: GetEntryTypeIcon(entryType: element.type),
        title: Text(DateFormat('dd MMM yyyy').format(element.entryDate)),
        subtitle: Text(element.type.toDisplayString()),
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
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit details'),
                onTap: () {
                  // Handle edit
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications_off),
                title: Text('Mute notifications'),
                onTap: () {
                  // Handle mute notifications
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete ${widget.bin.nickName}'),
                onTap: () {
                  // Handle delete
                },
              ),
            ],
          ),
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
