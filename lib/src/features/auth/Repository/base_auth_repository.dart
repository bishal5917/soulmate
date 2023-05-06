import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  Stream<auth.User> get user;
  Future<auth.User?> signUp({required String email, required String password});
  Future<auth.User?> logIn({required String email, required String password});
  Future<void> signOut();
}
