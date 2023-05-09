import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class AuthRepository extends BaseAuthRepository {
  @override
  Future<auth.User?> logIn(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseConfig()
          .firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DocumentReference> userRegister(RegisterModel regModel) async {
    try {
      final credential = await FirebaseConfig().baseDb.collection("Users").add(
            regModel.toJson(),
          );
      await FirebaseConfig().firebaseAuth.createUserWithEmailAndPassword(
          email: regModel.email as String,
          password: regModel.password as String);
      return credential;
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
