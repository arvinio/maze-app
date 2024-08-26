class Entry {
  final String binId;
  final EntryType type;
  final String? howFull;
  final List<String>? whatRecycled;
  final List<String>? whatDidAdd;
  final List<String>? compostUsed;
  final bool? mixed;
  final String? amount;
  final String note;
  final List<String>? photo;
  final DateTime entryDate;

  Entry({
    required this.whatRecycled,
    required this.whatDidAdd,
    required this.compostUsed,
    required this.entryDate,
    required this.binId,
    required this.type,
    required this.mixed,
    required this.note,
    required this.photo,
    required this.howFull,
    required this.amount,
  });
}

class EditEntry extends Entry {
  final String entryId;

  EditEntry(
    this.entryId, {
    required super.whatRecycled,
    required super.whatDidAdd,
    required super.compostUsed,
    required super.entryDate,
    required super.binId,
    required super.type,
    required super.mixed,
    required super.note,
    required super.photo,
    required super.howFull,
    required super.amount,
  });
}

enum EntryType {
  emptiedBin('emptied-bin'),
  generalNote('general-note'),
  addedWaste('added-waste'),
  emptiedCompost('emptied-compost');

  const EntryType(this.description);

  final String description;

  @override
  String toString() => description;

  static EntryType fromString(String str) {
    return values.firstWhere(
      (e) => e.toString() == str,
    );
  }
}
