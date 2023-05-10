part of 'local_image_cubit.dart';

enum LocalImageStatus {
  initial,
  loading,
  success,
  failure,
  removed,
}

class LocalImageState extends Equatable {
  final XFile? localImage;
  final String? message;
  final LocalImageStatus status;
  const LocalImageState({
    this.localImage,
    this.message,
    this.status = LocalImageStatus.initial,
  });

  LocalImageState copyWith({
    XFile? localImage,
    String? message,
    LocalImageStatus? status,
  }) {
    return LocalImageState(
      localImage: localImage ?? this.localImage,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [message, status, localImage];
}
