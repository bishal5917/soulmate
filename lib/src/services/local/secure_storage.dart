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
  static const _hobby1 = "hobby";
  static const _hobby2 = "hobby";
  static const _hobby3 = "hobby";

  static get firstTimeInApp =>
      _sharedPreference?.getBool(_firstTimeInApp) ?? true;
  static get getAuthToken => _sharedPreference?.getString(_authToken) ?? "";
  static get getRememberMe => _sharedPreference?.getBool(_rememberMe) ?? false;
  static get getUserId => _sharedPreference?.getString(_userId) ?? "";
  static get getHobby1 => _sharedPreference?.getString(_hobby1) ?? "";
  static get getHobby2 => _sharedPreference?.getString(_hobby2) ?? "";
  static get getHobby3 => _sharedPreference?.getString(_hobby3) ?? "";

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
  static setHobby1(String hobby1) async =>
      _sharedPreference?.setString(_hobby1, _hobby1);
  static setHobby2(String hobby2) async =>
      _sharedPreference?.setString(_hobby2, _hobby2);
  static setHobby3(String hobby3) async =>
      _sharedPreference?.setString(_hobby3, _hobby3);

  static clearCrendentials() async => _sharedPreference?.clear();

  static Future sharedPrefInit() async =>
      _sharedPreference = await SharedPreferences.getInstance();
}
