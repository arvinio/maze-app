import 'package:maze_app/core/config/strings.dart';

enum BinTypesEnum {
  landfillBin,
  councilLandfillBin,
  compostBin
}

extension CreateBinTypesExtension on BinTypesEnum {
  static BinTypesEnum getCreateBinTypesByName(String name) {
    switch (name) {
      case 'Landfill Bin':
        return BinTypesEnum.landfillBin;
      case 'Council Landfill Bin':
        return BinTypesEnum.councilLandfillBin;
      case 'Compost Bin':
        return BinTypesEnum.compostBin;

      default:
        return BinTypesEnum.landfillBin;
    }
  }
}


mixin Utility
{
  List<String> doesItHaveTwoCompartments() {
    return [
      appStrings.yes,
      appStrings.no];
  }
}

