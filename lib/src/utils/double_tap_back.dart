import '../core/app/colors.dart';

import 'custom_toasts.dart';

DateTime? currentBackPressTime;

Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime ?? DateTime.now()) >
          const Duration(seconds: 1)) {
    currentBackPressTime = now;
    CustomToasts.showToast(
      msg: "Press again to exit",
      color: OColors.kPrimaryMainColor,
    );
    return Future.value(false);
  }
  return Future.value(true);
}
