import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Register/register_model.dart';

abstract class BaseAuthRepository {
  Stream<auth.User> get user;
  Future<auth.User?> logIn({required String email, required String password});
  Future<String> userRegister(RegisterModel regModel);
  Future<List<dynamic>> userHobbyFetch();
  Future<void> sendOTP(String email);
  Future<void> imageUpload();
  Future<void> signOut();
}
