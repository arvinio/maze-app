enum CreateBinTypes {
  landfillBin,
  councilLandfillBin,
  compostBin
}

extension CreateBinTypesExtension on CreateBinTypes {
  static CreateBinTypes getCreateBinTypesByName(String name) {
    switch (name) {
      case 'Landfill Bin':
        return CreateBinTypes.landfillBin;
      case 'Council Landfill Bin':
        return CreateBinTypes.councilLandfillBin;
      case 'Compost Bin':
        return CreateBinTypes.compostBin;

      default:
        return CreateBinTypes.landfillBin;
    }
  }
}

