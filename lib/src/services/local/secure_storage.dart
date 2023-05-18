import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static final AppSharedPreferences _instance =
      AppSharedPreferences._internal();

  factory AppSharedPreferences() {
    return _instance;
  }

  AppSharedPreferences._internal();
  static SharedPreferences? _sharedPreference;

  static init() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  static const _authToken = "auth_token";
  static const _rememberMe = "remember_me";
  static const _firstTimeInApp = "first_time_in_app";
  static const _userId = "user_id";

  static get firstTimeInApp =>
      _sharedPreference?.getBool(_firstTimeInApp) ?? true;
  static get getAuthToken => _sharedPreference?.getString(_authToken) ?? "";
  static get getRememberMe => _sharedPreference?.getBool(_rememberMe) ?? false;
  static get getUserId => _sharedPreference?.getString(_userId) ?? "";

  static removeAuthToken() async => _sharedPreference?.remove(_authToken);
  static removeRememberMe() async => _sharedPreference?.remove(_rememberMe);
  static removeUserId() async => _sharedPreference?.remove(_userId);

  static setAuthToken(String authToken) async =>
      _sharedPreference?.setString(_authToken, authToken);
  static setFirstTimeInApp(bool firstTime) async =>
      _sharedPreference?.setBool(_firstTimeInApp, firstTime);
  static setRememberMe(bool rememberMe) async =>
      _sharedPreference?.setBool(_rememberMe, rememberMe);
  static setUserId(String userId) async =>
      _sharedPreference?.setString(_userId, userId);

  static clearCrendentials() async => _sharedPreference?.clear();

  static Future sharedPrefInit() async =>
      _sharedPreference = await SharedPreferences.getInstance();
}
