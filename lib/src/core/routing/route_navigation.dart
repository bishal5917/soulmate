import 'package:flutter/material.dart';

back(BuildContext context, [dynamic result]) {
  Navigator.pop(context, result);
}

navigate(BuildContext context, dynamic pageRoute, {bool isFullDialog = false}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: ((context) => pageRoute), fullscreenDialog: isFullDialog));
}

navigateNamed(BuildContext context, String routeName, {dynamic arguments}) {
  Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );
}

navigateAsyncNamed(BuildContext context, String routeName,
    {dynamic arguments, Function()? returnBackFunction}) async {
  bool? value =
      await Navigator.pushNamed(context, routeName, arguments: arguments);
  if (value == true) returnBackFunction;
}

navigateOffAllNamed(BuildContext context, String routeName, {Object? args}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
    arguments: args,
  );
}

replaceAndPush(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: ((context) => page),
    ),
  );
}
