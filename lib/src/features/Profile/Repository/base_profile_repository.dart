import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Profile/Models/user_request_model.dart';

abstract class BaseProfileRepository {
  Stream<auth.User> get user;
  Future<UserRequestModel> userDetailsFetch(userId);
  Future<void> signOut();
}
