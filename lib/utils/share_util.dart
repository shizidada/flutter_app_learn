import 'package:shared_preferences/shared_preferences.dart';

class ShareUtil {
  static void setBool(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  ////////////////////////////////////////
  static Future<bool> getBool(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
