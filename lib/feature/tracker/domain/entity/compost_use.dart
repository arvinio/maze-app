class CompostUseItem {
  final String name;
  bool isSelected;
  String? note;

  CompostUseItem({
    required this.name,
    this.isSelected = false,
    this.note,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompostUseItem &&
          runtimeType == other.runtimeType &&
          name == other.name);

  @override
  int get hashCode => name.hashCode;
}
