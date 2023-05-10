import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
  Future<void> imageUpload() async {
    try {
      firebase_storage.UploadTask? uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('/');
      ref.putFile(File(sl.get<LocalImageCubit>().localImage!.path));
      await uploadTask!.whenComplete(() => null);
      String imageUrl = await ref.getDownloadURL();
      // print("URL" + imageUrl);
      final credential = await FirebaseConfig()
          .baseDb
          .collection("Users")
          .doc(AppSharedPreferences.getUserId)
          .set({"image": imageUrl});
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
