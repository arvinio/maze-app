import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'crypto/encrypt_helper.dart';

@injectable
class SharedPreferencesHelper {
  final EncryptHelper encryptHelper;

  SharedPreferencesHelper({required this.encryptHelper});

  /* static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<bool> getBool(String key, {bool defaultValue}) async {
    final p = await prefs;
    return p.getBool(key) ?? defaultValue;
  }*/

  bool? getBool(String key, {bool? defaultValue}) {
    Globals.sharePrefs!.getBool(key) ?? defaultValue ?? false;
  }

  Future<bool> setBool(String key, bool value) async {
    return Globals.sharePrefs!.setBool(key, value);
  }

  int getInt(String key, {int? defaultValue}) {
    return Globals.sharePrefs!.getInt(key) ?? defaultValue ?? 0;
  }

  Future<bool> setInt(String key, int value) async {
    return Globals.sharePrefs!.setInt(key, value);
  }

  String getString(String key, {String? defaultValue}) {
    return Globals.sharePrefs!.getString(key) ?? defaultValue ?? '';
  }

  String getEncryptedString(String key, {String? defaultValue}) {
    var clearValue = encryptHelper
        .decryptCbcByPasswordKey(Globals.sharePrefs!.getString(key));
    return clearValue ?? defaultValue ?? '';
  }

  getJsonObject(String key, {String? defaultValue}) {
    var strObj = Globals.sharePrefs!.getString(key) ?? defaultValue ?? '{}';
    return json.decode(strObj);
  }

  Future<bool> setJsonObject(String key, Object object) async {
    return setString(key, json.encode(object));
  }

  Future<bool> setString(String key, String value) async {
    return Globals.sharePrefs!.setString(key, value);
  }

  Future<bool> setStringAndEncrypt(String key, String value) async {
    return Globals.sharePrefs!
        .setString(key, encryptHelper.encryptCbcByPasswordKey(value)!);
  }

  Future<double> getDouble(String key, {double? defaultValue}) async {
    return Globals.sharePrefs!.getDouble(key) ?? defaultValue ?? 0;
  }

  Future<bool> setDouble(String key, double value) async {
    return Globals.sharePrefs!.setDouble(key, value);
  }

  Future<bool> remove(String key) async {
    return Globals.sharePrefs!.remove(key);
  }
}

class Globals {
  static SharedPreferences? sharePrefs;
  static setSharedPreferences() async {
    sharePrefs = await SharedPreferences.getInstance();
  }
}
