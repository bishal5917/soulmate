import 'package:flutter/material.dart';
import 'package:soulmate/splash_screen.dart';
import '../configs/route_config.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteConfig.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    return null;
  }
}
