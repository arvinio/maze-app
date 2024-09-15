class WhatDidAddItem {
  final String name;
  final String description;
  bool isSelected;

  WhatDidAddItem({
    required this.name,
    required this.description,
    this.isSelected = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WhatDidAddItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description);

  @override
  int get hashCode => name.hashCode ^ description.hashCode;
}

class WhatDidAdd {
  String name;
  List<WhatDidAddItem> items;

  WhatDidAdd({required this.name, required this.items});
}
