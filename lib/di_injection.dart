import 'package:get_it/get_it.dart';
import 'package:soulmate/src/features/auth/Repository/auth_repository.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:soulmate/src/services/network/api_handler.dart';

import 'src/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'src/services/local/secure_storage.dart';

final sl = GetIt.instance; // sl is short for service locator

void initGetIt() {
  sl.registerSingleton<ApiHandler>(ApiHandler());
  sl.registerSingleton<SharedPreference>(SharedPreference());

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

  //forgot password cubit
  sl.registerLazySingleton(() => ForgotPasswordCubit());

  //reset password cubit
  sl.registerLazySingleton(() => ResetPasswordCubit());
}
