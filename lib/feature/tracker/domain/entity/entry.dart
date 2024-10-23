class Entry {
  final String binId;
  final EntryType type;
  final String? howFull;
  final List<String>? whatDidAdd;
  final List<String>? compostUsed;
  final bool? mixed;
  final String? amount;
  final String note;
  final List<String>? photo;
  final DateTime entryDate;

  Entry({
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
  emptiedBin('emptied-bin', ' Emptied bin'),
  generalNote('general-note', 'General note'),
  addedWaste('added-waste', 'Added waste'),
  emptiedCompost('emptied-compost', 'Emptied compost');

  const EntryType(this.description, this.displayText);

  final String description;
  final String displayText;

  @override
  String toString() => description;

  String toDisplayString() => displayText;

  static EntryType fromString(String str) {
    return values.firstWhere(
      (e) => e.toString() == str,
    );
  }
}
