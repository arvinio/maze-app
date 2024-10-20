import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';

class TrackerPreview extends StatefulWidget {
  const TrackerPreview({super.key, required this.onTap,
    required this.bin,});

  final VoidCallback onTap;
  final Bin bin;

  @override
  State<TrackerPreview> createState() => _TrackerPreviewState();
}

class _TrackerPreviewState extends State<TrackerPreview> {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
   String? lastEntry;

  @override
  void initState() {
    lastEntry= widget.bin.lastEntry!=null
        ? widget.bin.lastEntry.toString().substring(0, 10) == formatter.format(now)
        ? appStrings.today
        :  widget.bin.lastEntry.toString() == formatter.format(
        now.subtract(const Duration(days: 1)))
        ? appStrings.yesterday
        :now.difference(widget.bin.lastEntry!).inDays.toString()
        :'';
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.scheme().neutralsBorderDivider),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      height: 155.h,
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: Center(
              child: ListTile(
                onTap: widget.onTap,
                title: CustomText(
                  widget.bin.nickName,
                  style: context.titleHeadline
                ),
                subtitle: CustomText(
                  widget.bin.type ==BinType.landfill
                  ?appStrings.landfillWaste
                  :appStrings.compostTumbler,
                  style: context.footnoteFootnote
                      .copyWith(color: context.scheme().secondaryText),
                ),
                leading:Container(
                  decoration: BoxDecoration(
                    color: context.scheme().neutralsBackground,
                    border: Border.all(
                        color: context.scheme().neutralsBorderDivider),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimen.defaultRadius)),
                  ),
                  height: 50.sp,
                  width: 50.sp,
                  padding: widget.bin.imageUrl != null ?EdgeInsets.zero:EdgeInsets.only(top:6.sp),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimen.defaultRadius)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: widget.bin.imageUrl == null
                        ? const NoImage()
                        : Image.network(
                      widget.bin.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                trailing: const AppArrow(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.w,
            ),
            child: ListTile(
              title: CustomText(

                '${ widget.bin.totalAmount!=null ?widget.bin.totalAmount!.toDouble():0}${appStrings.kg}',
                style: context.subheadlineSubheadlineSemibold,
              ),
              subtitle: CustomText(
                widget.bin.totalAmount==0
                    ? appStrings.noDataAddedYet
                :widget.bin.type ==BinType.landfill
                    ?appStrings.addedToLandfill
                :'${appStrings.compostMade}, $lastEntry ${appStrings.daysAgo}',
                style: context.captionCaption
                    .copyWith(color: context.scheme().tertiaryText),
              ),
              trailing: SizedBox(
                width: 60.w,
                height: 30.h,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: widget.bin.chartData!.map(
                          (e) {
                            return BarChartRodData(
                                color: context.scheme().neutralsBorderDivider,
                                toY: e.value.toDouble() + 0.1);
                          },
                        ).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
