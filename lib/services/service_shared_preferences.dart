import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ServiceUserSharedPreferences {
  /// This class acts like main bloc of users module
  /// Singleton pattern
  static final ServiceUserSharedPreferences _serviceUserSharedPreferences =
      ServiceUserSharedPreferences._internal();

  ServiceUserSharedPreferences._internal();

  factory ServiceUserSharedPreferences() => _serviceUserSharedPreferences;

  Future<bool> saveIntoSharedPreferences(String key, dynamic value) async {
    bool savedItem = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case int:
        savedItem = await prefs.setInt(key, value);
        break;
      case String:
        savedItem = await prefs.setString(key, value);
        break;
      case List:
        if (value is List<String>) {
          savedItem = await prefs.setStringList(key, value);
        }
        break;
      case Map:
        if (value is Map<String, dynamic>) {
          try {
            final String valor = jsonEncode(value);
            savedItem = await prefs.setString(key, valor);
          } catch (e) {}
        }
        break;
      case double:
        savedItem = await prefs.setDouble(key, value);
        break;
      case bool:
        savedItem = await prefs.setBool(key, value);
        break;
      default:
        savedItem = await prefs.setString(key, "$value");
        break;
    }
    return savedItem;
  }

  Future<int> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  Future<double> getDoubleValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
  }

  Future<String> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<bool> getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) as bool;
  }

  Future<List<String>> getListStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tmp = <String>[];
    return prefs.getStringList(key) ?? tmp;
  }
}
