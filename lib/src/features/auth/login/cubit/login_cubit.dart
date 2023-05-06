import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // final LoginUsecase? loginUsecase;
  // final SaveCredentialsUsecase? saveCredentialsUsecase;
  LoginCubit() : super(const LoginState());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  TextEditingController get loginEmailController => _loginEmailController;
  TextEditingController get loginPasswordController => _loginPasswordController;

  // Future<void> login(LoginRequestModel? loginRequestModel) async {
  //   try {
  //     emit(state.copyWith(
  //       message: loggingPlsWaitText,
  //       status: LoginStatus.loading,
  //     ));
  // final response = await loginUsecase?.call(loginRequestModel);
  // inspect(response);
  // await response?.fold((failure) {
  //   emit(state.copyWith(
  //       message: failure.message, status: LoginStatus.failure));
  // }, (result) async {
  //   logger(result.message, loggerType: LoggerType.success);

  //   // await saveCredentialsUsecase?.call(SaveCredentialsRequestModel(
  //   //   token: result.token.toString(),
  //   //   userId: result.user?.id.toString(),
  //   //   email: result.user?.email.toString(),
  //   //   isGoogleSignIn: false,
  //   // ));

  //   // if (await SecureStorage().getNotificationId() == null) {
  //   //   sl.get<NotificationCubit>().notificationRegister();
  //   // }
  //   emit(
  //     state.copyWith(
  //       status: LoginStatus.success,
  //       message: result.message,
  //     ),
  //   );
  // });
  //   } on ApiFailure catch (e) {
  //     emit(state.copyWith(message: e.message, status: LoginStatus.failure));
  //   } catch (e) {
  //     emit(state.copyWith(message: e.toString(), status: LoginStatus.failure));
  //   }
  // }

  // @override
  // void reset() {
  //   _loginEmailController.clear();
  //   _loginPasswordController.clear();
  // }
}
