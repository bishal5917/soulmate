import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Profile/Models/user_request_model.dart';
import 'package:soulmate/src/features/Profile/Repository/base_profile_repository.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class ProfileRepository extends BaseProfileRepository {
  @override
  Future<UserRequestModel> userDetailsFetch(userId) async {
    try {
      final details =
          await FirebaseConfig().baseDb.collection("Users").doc(userId).get();
      final UserRequestModel loggedUserDetails = UserRequestModel(
          birthYear: details.get("birthYear"),
          email: details.get("email"),
          gender: details.get("gender"),
          hobbies: details.get("hobbies"),
          image: details.get("image"),
          name: details.get("name"),
          phone: details.get("phone"));
      return loggedUserDetails;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseConfig().firebaseAuth.signOut();
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
