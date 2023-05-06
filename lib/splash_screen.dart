import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/auth/login/login_screen.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
        () => {navigate(context, const LoginScreen())});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Icon(
          Icons.heart_broken_outlined,
          size: 90,
          color: Colors.red,
        )));
  }
}
