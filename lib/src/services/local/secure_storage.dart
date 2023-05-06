import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static final SharedPreference _instance = SharedPreference._internal();

  factory SharedPreference() {
    return _instance;
  }

  SharedPreference._internal();
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const _tokenKey = "token";
  static const _userid = "userid";
  static const _email = "email";

  static String? getToken() {
    return prefs?.getString(_tokenKey);
  }
}
