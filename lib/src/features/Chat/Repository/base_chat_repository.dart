import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Register/register_model.dart';

abstract class BaseChatRepository {
  Stream<auth.User> get user;
  Future<void> createChat(
    String userId,
    String anotherUserId,
  );
  Future<bool> checkChatExists(String userId, String anotherUserId);
}
