import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Home/Repository/base_home_repository.dart';
import 'package:soulmate/src/features/Home/feed_request_model.dart';
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class HomeRepository extends BaseHomeRepository {
  @override
  Future<List<FeedRequestModel>?> getFeed(String userId) async {
    try {
      List<FeedRequestModel> feedListData = [];
      await FirebaseConfig()
          .baseDb
          .collection('Users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            if (doc.id != AppSharedPreferences.getUserId) {
              // feedListData.add(FeedRequestModel.fromJson(
              //     doc.data() as Map<String, dynamic>));
              feedListData.add(FeedRequestModel(
                  fid: doc.id,
                  birthYear: doc.get("birthYear"),
                  hobbies: doc.get("hobbies"),
                  image: doc.get("image"),
                  name: doc.get("name"),
                  phone: doc.get("phone")));
              // consolelog(doc.data());
            }
          },
        );
      });
      consolelog(feedListData);
      return feedListData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
