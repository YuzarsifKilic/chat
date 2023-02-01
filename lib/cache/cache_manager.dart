import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  SharedPreferences? preferences;

  CacheManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveString(String key, String value) async {
    final response = await preferences?.setString(key, value);
    return response ?? false;
  }

  String? getString(String key) {
    return preferences?.getString(key);
  }

  Future<bool> saveStringList(String key, List<String> value) async {
    final response = await preferences?.setStringList(key, value);
    return response ?? false;
  }

  List<String>? getStrings(String key) {
    return preferences?.getStringList(key);
  }

  Future<bool> saveBool(String key, bool value) async {
    final response = await preferences?.setBool(key, value);
    return response ?? false;
  }

  Future<void> removeString(String key) async {
    await preferences?.remove(key);
  }

  Future<bool> removeItem(String key) async {
    return (await preferences?.remove(key)) ?? false;
  }
}
