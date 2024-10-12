import 'package:maze_app/feature/tracker/data/model/bin_list/bin_list_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';

class Bin {
  final String? id;
  final String nickName;
  final SizeType sizeType;
  final BinType type;
  // if sizeType == liters
  final int? amountOfLiters;
  final bool isShare;
  final String? imageUrl;
  // if type == (landfill || recycling)
  final String? pickUpDate;
  // if type == compost
  final TypeOfCompostBin? typeOfCompostBin;
  final bool? is2Compostement;
  // if sizetype = dimensions
  final String? width;
  final String? length;
  final String? height;
  final int? totalAmount;
  final List<ChartData>? chartData;

  const Bin({
    required this.type,
    required this.id,
    required this.nickName,
    required this.sizeType,
    required this.amountOfLiters,
    required this.isShare,
    required this.imageUrl,
    required this.pickUpDate,
    required this.typeOfCompostBin,
    required this.is2Compostement,
    required this.width,
    required this.length,
    required this.height,
    this.totalAmount,
    this.chartData,
  });
}

enum BinType {
 // organic,
  landfill,
  //recycling,
  compost
}

enum SizeType {
  litres,
  dimensions,
}
