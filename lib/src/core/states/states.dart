import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//global scaffold key
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

// List<CountryModel> countryModelData = <CountryModel>[];

ValueNotifier<bool> showPassswordVisibility = ValueNotifier<bool>(false);

ValueNotifier<String?> selectedGender = ValueNotifier<String?>("");

List<String> genderOptions = ["male", "female"];
