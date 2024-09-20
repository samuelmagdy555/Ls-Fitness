import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCash(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<void> insertIntToCash(
      {required String key, required int value}) async {
    await sharedPreferences.setInt(key, value);
  }
  static Future<int> getIntFromCash({required String key}) async {
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<bool> insertBoolToCash(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<String> getFromCash({required String key}) async {
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<bool> getBoolFromCash({required String key}) async {
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<bool> deleteFromCash({required String key}) async {
    return await sharedPreferences.remove(key);
  }
  static Future<bool> deleteAll() async {
    return await sharedPreferences.clear();
  }
}
