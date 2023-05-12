part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus {
  initial,
  submitting,
  sent,
  error,
}

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String? message;
  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.message,
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? message,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}

class ForgotPasswordInitial extends ForgotPasswordState {}
