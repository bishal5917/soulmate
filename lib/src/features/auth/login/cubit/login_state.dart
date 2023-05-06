part of 'login_cubit.dart';

enum LoginStatus {
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? message;
  const LoginState({
    this.status = LoginStatus.loading,
    this.message,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
