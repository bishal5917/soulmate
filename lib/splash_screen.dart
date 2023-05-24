import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/medias.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/AddImage/add_image_screen.dart';
import 'package:soulmate/src/features/Chat/chat_screen.dart';
import 'package:soulmate/src/features/Home/home_screen.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/Register/widgets/choose_hobbies_screen.dart';
import 'package:soulmate/src/features/auth/login/login_screen.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/utils/double_tap_back.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => AppSharedPreferences.getUserId.toString().isEmpty
          ? navigate(context, const LoginScreen())
          : navigate(context, const HomeScreen()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          backgroundColor: OColors.kSplashScreenColor,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.heart_broken_outlined,
                size: 90,
                color: Colors.red,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: OColors.kSplashScreenColor,
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/svg/logo.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: OColors.kPrimaryMainColor,
                strokeWidth: BorderSide.strokeAlignOutside,
              )
            ],
          ))),
    );
  }
}
