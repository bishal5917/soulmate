import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:laundry_mobile_app/src/core/error/failures.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _forgotPasswordEmailController =
      TextEditingController();

  TextEditingController get forgotPasswordEmailController =>
      _forgotPasswordEmailController;

  // Future<void> login(LoginRequestModel? loginRequestModel) async {
  //   try {
  //     emit(state.copyWith(
  //       message: loggingPlsWaitText,
  //       status: LoginStatus.loading,
  //     ));
  //     // final response = await loginUsecase?.call(loginRequestModel);
  //     // inspect(response);
  //     // await response?.fold((failure) {
  //     //   emit(state.copyWith(
  //     //       message: failure.message, status: LoginStatus.failure));
  //     // }, (result) async {
  //     //   logger(result.message, loggerType: LoggerType.success);

  //     //   // await saveCredentialsUsecase?.call(SaveCredentialsRequestModel(
  //     //   //   token: result.token.toString(),
  //     //   //   userId: result.user?.id.toString(),
  //     //   //   email: result.user?.email.toString(),
  //     //   //   isGoogleSignIn: false,
  //     //   // ));

  //     //   // if (await SecureStorage().getNotificationId() == null) {
  //     //   //   sl.get<NotificationCubit>().notificationRegister();
  //     //   // }
  //     //   emit(
  //     //     state.copyWith(
  //     //       status: LoginStatus.success,
  //     //       message: result.message,
  //     //     ),
  //     //   );
  //     // });
  //   } on ApiFailure catch (e) {
  //     emit(state.copyWith(
  //         message: e.message, status: ForgotPasswordStatus.failure));
  //   } catch (e) {
  //     emit(state.copyWith(
  //         message: e.toString(), status: ForgotPasswordStatus.failure));
  //   }
  // }
}
