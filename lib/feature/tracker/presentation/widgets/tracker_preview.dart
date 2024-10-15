import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';

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
      height: 165.h,
      child: Column(
        children: [
          SizedBox(
            height: 88.h,
            child: Center(
              child: ListTile(
                onTap: onTap,
                title: CustomText(
                  bin.nickName,
                  style: context.titleHeadline
                ),
                subtitle: CustomText(
                  bin.type ==BinType.landfill?
                  '${bin.type.name} waste'
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
                  padding: bin.imageUrl != null ?EdgeInsets.zero:EdgeInsets.only(top:6.sp),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimen.defaultRadius)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: bin.imageUrl == null
                        ? const NoImage()
                        : Image.network(
                      bin.imageUrl!,
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
              left: 20.w,
            ),
            child: ListTile(
              title: CustomText(
                '${bin.totalAmount} kg',
                style: context.subheadlineSubheadlineSemibold,
              ),
              subtitle: CustomText(
                bin.totalAmount==0
                    ? appStrings.noDataAddedYet
                :'Waste',
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
