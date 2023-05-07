import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/splash_screen.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:soulmate/src/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/login/login_screen.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:soulmate/src/features/auth/reset_password/reset_password_screen.dart';
import 'package:soulmate/src/features/onboarding/select_country/cubit/select_country_cubit.dart';
import 'package:soulmate/src/features/onboarding/select_country/select_country_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await Firebase.initializeApp();

  runApp(const MyApp());
  // Bloc.observer = AppBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<LoginCubit>(),
          child: const LoginScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<ResetPasswordCubit>(),
          child: const ResetPasswordScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<ForgotPasswordCubit>(),
          child: const ForgotPasswordScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<RegisterCubit>(),
          child: const UserRegister(),
        ),
        BlocProvider(create: (context) => sl.get<SelectCountryCubit>()),
      ],
      child: MaterialApp(
        title: 'Soulmate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: OColors.kPrimaryMainColor,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            elevation: 0,
          ),
          brightness: Theme.of(context).brightness,
          disabledColor: Colors.grey,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: OColors.kPrimaryMainColor,
          fontFamily: 'Inter',
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              elevation: 0,
              foregroundColor: OColors.kPrimaryMainColor,
              backgroundColor: OColors.kPrimaryMainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBackgroundColor: Colors.grey.shade400,
              disabledIconColor: Colors.grey.shade300,
              disabledForegroundColor: Colors.grey.shade300,
              shadowColor: Colors.transparent,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: OColors.kPrimaryMainColor,
              elevation: 0,
              foregroundColor: OColors.kPrimaryMainColor,
              shadowColor: Colors.transparent,
              disabledBackgroundColor: Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
