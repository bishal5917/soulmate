// import 'package:bloc/bloc.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/app_bloc_observer.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/splash_screen.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/features/AddImage/add_image_screen.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Chat/chat_screen.dart';
import 'package:soulmate/src/features/Chat/cubit/chat_cubit.dart';
import 'package:soulmate/src/features/Message/Chat.dart';
import 'package:soulmate/src/features/Chat/widgets/convo_list_item.dart';
import 'package:soulmate/src/features/FeedDetail/feed_detail_screen.dart';
import 'package:soulmate/src/features/Home/cubit/home_cubit.dart';
import 'package:soulmate/src/features/Home/home_screen.dart';
import 'package:soulmate/src/features/Message/cubit/message_cubit.dart';
import 'package:soulmate/src/features/Profile/cubit/profile_cubit.dart';
import 'package:soulmate/src/features/Profile/profile_screen.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/Register/widgets/choose_hobbies_screen.dart';
import 'package:soulmate/src/features/Register/widgets/cubit/choose_hobbies_cubit.dart';
import 'package:soulmate/src/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:soulmate/src/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/login/login_screen.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:soulmate/src/features/auth/reset_password/reset_password_screen.dart';
import 'package:soulmate/src/features/onboarding/select_country/cubit/select_country_cubit.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
// import 'package:soulmate/src/features/onboarding/select_country/select_country_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  AppSharedPreferences.init();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
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
        BlocProvider(
          create: (context) => sl.get<LocalImageCubit>(),
          child: const AddImageScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<HomeCubit>(),
          child: const HomeScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<ChatCubit>(),
          child: const ChatScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<MessageCubit>(),
          child: const Chat(),
        ),
        BlocProvider(
          create: (context) => sl.get<ProfileCubit>(),
          child: const ProfileScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<ChooseHobbiesCubit>(),
          child: ChooseHobbiesScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<SelectCountryCubit>(),
        ),
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
        routes: {
          '/login': (context) => const LoginScreen(),
          '/open_chat': (context) => const Chat(),
          '/feed_detail': (context) => const FeedDetailScreen(),
          '/home': (context) => const HomeScreen()
        },
      ),
    );
  }
}
