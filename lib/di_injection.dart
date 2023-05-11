import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Home/Repository/home_repository.dart';
import 'package:soulmate/src/features/Home/cubit/home_cubit.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/features/auth/Repository/auth_repository.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:soulmate/src/features/onboarding/select_country/cubit/select_country_cubit.dart';
import 'package:soulmate/src/services/network/api_handler.dart';

import 'src/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'src/services/local/secure_storage.dart';

final sl = GetIt.instance; // sl is short for service locator

void initGetIt() {
  // sl.registerSingleton<ApiHandler>(ApiHandler());
  // sl.registerSingleton<SharedPreference>(SharedPreference());
  sl.registerSingleton<AppSharedPreferences>(AppSharedPreferences());

  datasources();
  repositories();
  usecase();
  cubit();
}

//datasources
void datasources() {}

//repositories
void repositories() {}

//usecase
void usecase() {}

//cubit
void cubit() {
  //login cubit
  sl.registerLazySingleton(() => LoginCubit(authRepository: AuthRepository()));

  //login cubit
  sl.registerLazySingleton(() => HomeCubit(authRepository: HomeRepository()));

  //Register cubit
  sl.registerLazySingleton(() => RegisterCubit());

  //forgot password cubit
  sl.registerLazySingleton(() => ForgotPasswordCubit());

  //reset password cubit
  sl.registerLazySingleton(() => ResetPasswordCubit());

  //select country cubit
  sl.registerLazySingleton(() => SelectCountryCubit());

  //local Image cubit
  sl.registerLazySingleton(() => LocalImageCubit());
}
