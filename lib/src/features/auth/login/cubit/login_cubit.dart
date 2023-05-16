import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/features/auth/Repository/auth_repository.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  TextEditingController get loginEmailController => _loginEmailController;
  TextEditingController get loginPasswordController => _loginPasswordController;

  Future<void> userLogin() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      final response = await _authRepository.logIn(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      AppSharedPreferences.setUserId(response!.uid);
      final hobbies = await _authRepository.userHobbyFetch();
      AppSharedPreferences.setHobby1(hobbies[0]);
      AppSharedPreferences.setHobby2(hobbies[1]);
      AppSharedPreferences.setHobby3(hobbies[2]);
      emit(state.copyWith(status: LoginStatus.success, user: response));
    } catch (err) {
      // print(e.toString());
      emit(state.copyWith(status: LoginStatus.error, message: err.toString()));
    }
  }

  void logOut() {
    emit(state.copyWith(
        status: LoginStatus.loggingOut, message: "Logging out ..."));
    try {
      _authRepository.signOut();
      AppSharedPreferences.clearCrendentials();
      emit(state.copyWith(
          status: LoginStatus.loggedOut, message: "Logged out successfully !"));
    } catch (err) {
      emit(state.copyWith(status: LoginStatus.error, message: err.toString()));
    }
  }

  @override
  void reset() {
    _loginEmailController.clear();
    _loginPasswordController.clear();
  }
}
