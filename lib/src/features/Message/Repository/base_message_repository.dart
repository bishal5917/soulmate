import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Register/register_model.dart';

abstract class BaseMessageRepository {
  Stream<auth.User> get user;
  Future<void> sendMessage(
      String conversationId, String senderId, String message, String sentTime);
}
