part of 'reset_password_cubit.dart';

enum ResetPasswordStatus {
  loading,
  success,
  failure,
}

class ResetPasswordState extends Equatable {
  final ResetPasswordStatus status;
  final String? message;
  const ResetPasswordState({
    this.status = ResetPasswordStatus.loading,
    this.message,
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    String? message,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}

class ResetPasswordInitial extends ResetPasswordState {}
