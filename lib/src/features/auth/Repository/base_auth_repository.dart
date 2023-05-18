import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/auth/Models/login_request_model.dart';

abstract class BaseAuthRepository {
  Stream<auth.User> get user;
  Future<auth.User?> logIn({required String email, required String password});
  Future<String> userRegister(RegisterModel regModel);
  Future<LoginRequestModel> userDetailsFetch(userId);
  Future<void> sendOTP(String email);
  Future<void> imageUpload();
}
