import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToasts {
  static showToast({
    String? msg,
    Color? color = Colors.redAccent,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}

errorToast({String msg = "Please validate all data"}) {
  CustomToasts.showToast(msg: msg, color: Colors.red);
}

successToast({String? msg}) {
  CustomToasts.showToast(msg: msg, color: Colors.green);
}
