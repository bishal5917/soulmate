import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/auth/Models/login_request_model.dart';
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
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
  Future<String> userRegister(RegisterModel regModel) async {
    try {
      final credential = await FirebaseConfig()
          .firebaseAuth
          .createUserWithEmailAndPassword(
              email: regModel.email as String,
              password: regModel.password as String);

      final newDoc = await FirebaseConfig()
          .baseDb
          .collection("Users")
          .doc(credential.user!.uid)
          .set(
            regModel.toJson(),
          );
      return credential.user!.uid;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  @override
  Future<LoginRequestModel> userDetailsFetch(userId) async {
    try {
      final details =
          await FirebaseConfig().baseDb.collection("Users").doc(userId).get();
      final LoginRequestModel loggedUserDetails = LoginRequestModel(
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
  Future<void> sendOTP(String email) async {
    try {
      await FirebaseConfig().firebaseAuth.sendPasswordResetEmail(email: email);
      // .then((value) => _status = AuthStatus.successful)
      // .catchError(
      //     (e) => _status = AuthExceptionHandler.handleAuthException(e));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> imageUpload() async {
    try {
      final firebaseStorage = FirebaseStorage.instance;

      final file = File(sl.get<LocalImageCubit>().localImage!.path);

      final storageRef = firebaseStorage.ref();
      final uploadTask = await storageRef
          .child(
              "profiles/${DateTime.now().millisecondsSinceEpoch}-${AppSharedPreferences.getUserId}")
          .putFile(file, SettableMetadata(contentType: "image/jpeg"));
      // print(uploadTask.snapshot);

      var downloadUrl = await uploadTask.ref.getDownloadURL();
      final credential = await FirebaseConfig()
          .baseDb
          .collection("Users")
          .doc(AppSharedPreferences.getUserId)
          .update({"image": downloadUrl});
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
