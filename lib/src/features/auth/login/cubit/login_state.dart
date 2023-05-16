part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, loggingOut, loggedOut, error }

class LoginState extends Equatable {
  final String? email;
  final String? password;
  final LoginStatus? status;
  final auth.User? user;
  final String? message;
  const LoginState(
      {this.email,
      this.password,
      this.status = LoginStatus.initial,
      this.user,
      this.message});

  factory LoginState.initial() {
    return const LoginState(
        email: "",
        password: "",
        status: LoginStatus.initial,
        user: null,
        message: "");
  }

  LoginState copyWith(
      {String? email,
      String? password,
      LoginStatus? status,
      auth.User? user,
      String? message}) {
    return LoginState(
        email: email ?? "",
        password: password ?? "",
        status: status ?? this.status,
        user: user ?? this.user,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [email, password, status, user, message];
}
