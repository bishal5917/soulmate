import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController _resetPasswordOtpController =
      TextEditingController();
  final TextEditingController _resetPasswordPasswordController =
      TextEditingController();
  final TextEditingController _resetPasswordConfirmPasswordController =
      TextEditingController();

  TextEditingController get resetPasswordOtpController =>
      _resetPasswordOtpController;
  TextEditingController get resetPasswordPasswordController =>
      _resetPasswordPasswordController;
  TextEditingController get resetPasswordConfirmPasswordController =>
      _resetPasswordConfirmPasswordController;
}
