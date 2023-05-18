part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, loggingOut, loggedOut, error }

class LoginState extends Equatable {
  final LoginStatus? status;
  final String? message;
  const LoginState({this.status = LoginStatus.initial, this.message});

  factory LoginState.initial() {
    return const LoginState(status: LoginStatus.initial, message: "");
  }

  LoginState copyWith(
      {LoginStatus? status, String? message, LoginRequestModel? userDetails}) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
