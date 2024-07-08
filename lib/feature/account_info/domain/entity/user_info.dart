import 'dart:core';
import 'dart:io';

import 'package:injectable/injectable.dart';

@lazySingleton
class UserInfo {
  String? firstName;
  File? avatar;
  String? lastName;
  String? birthDate;
  String? username;
  bool notification = false;
  String? country;
  String? state;
  String? council;
  String? postcode;
  int? householdSize;


}

