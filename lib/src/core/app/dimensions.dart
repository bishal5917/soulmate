import 'dart:ui' as ui;

import 'package:flutter/material.dart';

const double vBox0 = 5.0;
const double vBox1 = 10.0;
const double vBox2 = 20.0;
const double vBox2andHalf = 30;
const double vBox3 = 40.0;
const double vBox4 = 80.0;
const double hBox0 = 5.0;
const double hBox1 = 10.0;
const double hBox2 = 20.0;
const double hBox3 = 40.0;
const double hBox4 = 80.0;
const SizedBox vSizedBox0 = SizedBox(height: vBox0);
const SizedBox vSizedBox1 = SizedBox(height: vBox1);
const SizedBox vSizedBox2 = SizedBox(height: vBox2);
const SizedBox vSizedBox2andHalf = SizedBox(height: vBox2andHalf);
const SizedBox vSizedBox3 = SizedBox(height: vBox3);
const SizedBox vSizedBox4 = SizedBox(height: vBox4);
const SizedBox hSizedBox0 = SizedBox(width: hBox0);
const SizedBox hSizedBox1 = SizedBox(width: hBox1);
const SizedBox hSizedBox2 = SizedBox(width: hBox2);
const SizedBox hSizedBox3 = SizedBox(width: hBox3);
const SizedBox hSizedBox4 = SizedBox(width: hBox4);

//only use it outside the widget with no ctx for responsive height and it wont work for widget
var kHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;
//only use it outside the widget with no ctx for responsive width and it wont work for widget
var kWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
//only use it inside the widget body for responsive height
appHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//only use it inside the widget body for responsive width
appWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//padding for whole screen
const screenPadding = EdgeInsets.all(16);
const screenLeftRightPadding = EdgeInsets.symmetric(horizontal: 16);

//text form field border radius
const borderRadius = 5.0;
