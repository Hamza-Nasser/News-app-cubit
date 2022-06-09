

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences prefs;


  static prefsInit()async{
    prefs = await SharedPreferences.getInstance();
  }
  static Future<bool> setPrefsBoolean(
    {required String key, required value}
  )async{
    return await prefs.setBool(key, value);
  }
  static bool getPrefsBoolean(String key){
    return prefs.getBool(key)??false;
  }
}