part of 'register_cubit.dart';

enum RegisterStatus {
  initial,
  dataEntering,
  dataError,
  registerStarting,
  registerSuccess,
  imageUploadStarting,
  imageUploadSuccess,
  error
}

class RegisterState extends Equatable {
  final RegisterStatus? status;
  final String? message;
  const RegisterState({this.status = RegisterStatus.initial, this.message});

  factory RegisterState.initial() {
    return const RegisterState(status: RegisterStatus.initial, message: "");
  }

  RegisterState copyWith({RegisterStatus? status, String? message}) {
    return RegisterState(
        status: status ?? this.status, message: message ?? this.message);
  }

  @override
  List<Object?> get props => [status, message];
}

class RegisterInitial extends RegisterState {}
