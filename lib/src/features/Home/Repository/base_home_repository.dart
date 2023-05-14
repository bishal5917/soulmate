import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Home/feed_request_model.dart';

abstract class BaseHomeRepository {
  Stream<auth.User> get user;
  Future<List<FeedRequestModel>?> getFeed(String userId);
  
}
