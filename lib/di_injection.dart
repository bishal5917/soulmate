import 'package:get_it/get_it.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Chat/Repository/chat_repository.dart';
import 'package:soulmate/src/features/Chat/cubit/chat_cubit.dart';
import 'package:soulmate/src/features/Home/Repository/home_repository.dart';
import 'package:soulmate/src/features/Home/cubit/home_cubit.dart';
import 'package:soulmate/src/features/Message/Repository/message_repository.dart';
import 'package:soulmate/src/features/Message/cubit/message_cubit.dart';
import 'package:soulmate/src/features/Profile/Repository/profile_repository.dart';
import 'package:soulmate/src/features/Profile/cubit/profile_cubit.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/features/Register/widgets/cubit/choose_hobbies_cubit.dart';
import 'package:soulmate/src/features/auth/Repository/auth_repository.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';

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

  //forgot password cubit
  sl.registerLazySingleton(
      () => ForgotPasswordCubit(authRepository: AuthRepository()));

  //chat cubit
  sl.registerLazySingleton(() => ChatCubit(chatRepository: ChatRepository()));

  //profile cubit
  sl.registerLazySingleton(
      () => ProfileCubit(profileRepository: ProfileRepository()));

  //message cubit
  sl.registerLazySingleton(
      () => MessageCubit(messageRepository: MessageRepository()));

  //reset password cubit
  sl.registerLazySingleton(() => ResetPasswordCubit());

  //Register cubit
  sl.registerLazySingleton(() => RegisterCubit());

  //local Image cubit
  sl.registerLazySingleton(() => LocalImageCubit());

  //local Image cubit
  sl.registerLazySingleton(() => ChooseHobbiesCubit());
}
