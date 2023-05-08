import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      // final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      //     email: email, password: password);
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  @override
  Future<auth.User?> logIn(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential.user);
      final user = credential.user;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
