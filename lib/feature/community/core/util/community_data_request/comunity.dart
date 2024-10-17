import 'dart:io';

class Community {
  String? id;
  String? name;
  String? description;
  List<String>? invites;
  File? cover;
  File? avatar;

  Community({
    this.id,
    this.name,
    this.description,
    this.invites,
    this.cover,
    this.avatar,
  });
}

