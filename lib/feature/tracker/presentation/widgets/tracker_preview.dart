import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';

class TrackerPreview extends StatelessWidget {
  const TrackerPreview({
    super.key,
    required this.onTap,
    required this.bin,
  });

  final VoidCallback onTap;
  final Bin bin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.scheme().neutralsBorderDivider),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      height: 160.h,
      child: Column(
        children: [
          SizedBox(
            height: 88.h,
            child: Center(
              child: ListTile(
                onTap: onTap,
                title: Text(
                  bin.nickName,
                  style: context.subheadlineSubheadline.copyWith(
                    color: context.scheme().primaryText,
                  ),
                ),
                subtitle: CustomText(
                  '${bin.type.name} waste',
                  style: context.footnoteFootnote
                      .copyWith(color: context.scheme().secondaryText),
                ),
                leading: Container(
                  padding: EdgeInsets.all(3.sp),
                  height: 50.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: context.scheme().neutralsBorderDivider),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.network(
                        bin.imageUrl!,
                        fit: BoxFit.contain,
                      )),
                ),
                trailing: const AppArrow(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
            ),
            child: ListTile(
              title: CustomText(
                '${bin.totalAmount}kg',
                style: context.subheadlineSubheadline
                    .copyWith(color: context.scheme().primaryText),
              ),
              subtitle: CustomText(
                'Waste',
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
                        barRods: bin.chartData!.map(
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
