part of 'profile_cubit.dart';

enum ProfileStatus { initial, fetching, success, loggingOut, loggedOut, error }

class ProfileState extends Equatable {
  final ProfileStatus? status;
  final String? message;
  final UserRequestModel? reqestedUser;
  const ProfileState(
      {this.status = ProfileStatus.initial, this.message, this.reqestedUser});

  factory ProfileState.initial() {
    return const ProfileState(
        status: ProfileStatus.initial, message: "", reqestedUser: null);
  }

  @override
  List<Object?> get props => [status, message, reqestedUser];

  ProfileState copyWith(
      {ProfileStatus? status,
      String? message,
      UserRequestModel? reqestedUser}) {
    return ProfileState(
        status: status ?? this.status,
        message: message ?? this.message,
        reqestedUser: reqestedUser ?? this.reqestedUser);
  }
}

class ProfileInitial extends ProfileState {}
