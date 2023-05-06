import 'package:flutter/material.dart';

import '../core/app/colors.dart';
import '../core/app/dimensions.dart';
import '../core/app/texts.dart';
import '../core/routing/route_navigation.dart';
import '../core/states/states.dart';

class CustomDialogs {
  static void cancelDialog(context) {
    back(context);
  }

  static fullLoadingDialog({String? data, BuildContext? context}) {
    showGeneralDialog(
      context: context ?? navigatorKey.currentContext!,
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(0.3),
      barrierLabel: data ?? loadingText,
      pageBuilder: (context, anim1, anim2) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0.2),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        OColors.kPrimaryMainColor,
                      ),
                    ),
                  ),
                  vSizedBox0,
                  Text(
                    data ?? loadingText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
