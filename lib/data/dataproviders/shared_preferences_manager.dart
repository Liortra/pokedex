import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  static Future<bool> setStringAndEncode(String key, dynamic value) async => await _prefs.setString(key, json.encode(value));

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs.setStringList(key, value);

  static bool containsKey(String key) => _prefs.getString(key) != null;

  static bool getBool(String key) => _prefs.getBool(key) ?? false;

  static double getDouble(String key) => _prefs.getDouble(key) ?? 0.0;

  static int getInt(String key) => _prefs.getInt(key) ?? 0;

  static String getString(String key) => _prefs.getString(key) ?? "";

  static dynamic getStringAndDecode(String key) => json.decode(_prefs.getString(key) ?? "");

  static List<String> getStringList(String key) => _prefs.getStringList(key) ?? <String> [];

  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static Future<bool> clear() async => await _prefs.clear();
}

// hot observable  |  cold observable
//     Stream              Future
