import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String isAlreadyInstalledApp = "isAlreadyInstalledApp";
  static const String authToken = "authToken";

  void setStringIntoCache(String key, String? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value ?? "");
  }

  void setListIntoCache(String key, List<String>? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(key, value!);
  }

  void setBooleanIntoCache(String? key, bool? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(key!, value!);
  }

  void setIntIntoCache(String? key, int? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(key!, value ?? 0);
  }

  Future<String> getStringFromCache(String? key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key!) ?? '';
  }

  Future<List<String>?> getListFromCache(String? key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key!);
  }

  Future<int> getIntFromCache(String? key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key!) ?? 0;
  }

  Future<bool> getBooleanFromCache(String? key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key!) ?? false;
  }

  void removeStringFromCache(String? key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key!);
  }
}