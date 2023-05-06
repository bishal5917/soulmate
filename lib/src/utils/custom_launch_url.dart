import 'custom_toasts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLaunch {
  static Future<void> launch(String url) async {
    try {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        errorToast(msg: "couldnotLaunchTryAgainText");
        throw "couldnotLaunchText $url";
      }
    } catch (e) {
      errorToast(msg: "couldnotLaunchTryAgainText");
    }
  }

  static Future<void> launchEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: "mailToText",
      path: email,
    );
    try {
      if (!await launchUrl(
        launchUri,
        mode: LaunchMode.externalApplication,
      )) {
        errorToast(msg: "couldnotLaunchTryAgainText");
        throw "couldnotLaunchText $email";
      }
    } catch (e) {
      errorToast(msg: "couldnotLaunchTryAgainText");
    }
  }
}
