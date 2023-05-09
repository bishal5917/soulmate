import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class AuthRepository extends BaseAuthRepository {
  // final auth.FirebaseAuth _firebaseAuth;

  // AuthRepository({});

  @override
  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      // final credential =
      //     await FirebaseConfig().baseDb.collection("Users").add({"name": "ok"});
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  @override
  Future<auth.User?> logIn(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseConfig()
          .firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential.user);
      final user = credential.user;
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
