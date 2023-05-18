part of 'profile_cubit.dart';

enum ProfileStatus { initial, fetching, success, loggingOut, loggedOut, error }

class ProfileState extends Equatable {
  final ProfileStatus? status;
  final String? message;
  final UserRequestModel? loggedUser;
  const ProfileState(
      {this.status = ProfileStatus.initial, this.message, this.loggedUser});

  factory ProfileState.initial() {
    return const ProfileState(
        status: ProfileStatus.initial, message: "", loggedUser: null);
  }

  @override
  List<Object?> get props => [status, message, loggedUser];

  ProfileState copyWith(
      {ProfileStatus? status, String? message, UserRequestModel? loggedUser}) {
    return ProfileState(
        status: status ?? this.status,
        message: message ?? this.message,
        loggedUser: loggedUser ?? this.loggedUser);
  }
}

class ProfileInitial extends ProfileState {}
