import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';

class BinChartData {
  final List<ChartData> chartWeek;
  final List<ChartData> chartMonth;
  final List<ChartData> chartYear;

  BinChartData({
    required this.chartWeek,
    required this.chartMonth,
    required this.chartYear,
  });
}
