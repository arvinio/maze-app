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
  final String? typeOfCompostBin;
  final bool? is2Compostement;
  // if sizetype = dimensions
  final String? width;
  final String? length;
  final String? height;

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
  });
}

enum BinType {
  organic,
  landfill,
  recycling,
  compost,
}

enum SizeType {
  litres,
  dimensions,
}
