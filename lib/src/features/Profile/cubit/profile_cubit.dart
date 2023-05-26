import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Profile/Models/user_request_model.dart';
import 'package:soulmate/src/features/Profile/Repository/profile_repository.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileCubit({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const ProfileState());

  Future<void> getDetails(String id) async {
    emit(
      state.copyWith(
        status: ProfileStatus.fetching,
        message: "fetching user",
        reqestedUser: null,
      ),
    );
    try {
      final response = await _profileRepository.userDetailsFetch(id);
      consolelog(response.name);
      emit(state.copyWith(
          status: ProfileStatus.success,
          reqestedUser: response,
          message: 'success'));
    } catch (err) {
      // print(e.toString());
      emit(state.copyWith(
          status: ProfileStatus.error,
          message: err.toString(),
          reqestedUser: null));
    }
  }

  void logOut() {
    emit(state.copyWith(
        status: ProfileStatus.loggingOut, message: "Logging out ..."));
    try {
      _profileRepository.signOut();
      AppSharedPreferences.clearCrendentials();
      emit(state.copyWith(
          status: ProfileStatus.loggedOut,
          message: "Logged out successfully !"));
    } catch (err) {
      emit(
          state.copyWith(status: ProfileStatus.error, message: err.toString()));
    }
  }
}
