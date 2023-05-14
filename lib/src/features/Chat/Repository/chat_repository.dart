import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Chat/Repository/base_chat_repository.dart';
import 'package:soulmate/src/features/Chat/models/conversation_request_model.dart';
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/auth/Repository/base_auth_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class ChatRepository extends BaseChatRepository {
  @override
  Future<void> createChat(String userId, String anotherUserId,
      String anotherUserName, String anotherUserImage) async {
    try {
      await FirebaseConfig().baseDb.collection("Convos").doc().set({
        "fname": anotherUserName,
        "fimage": anotherUserImage,
        "members": [userId, anotherUserId]
      });
      // }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> checkChatExists(String userId, String anotherUserId) async {
    try {
      var total = 0;
      await FirebaseConfig()
          .baseDb
          .collection('Convos')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            if (doc.get("members").contains(userId) &&
                doc.get("members").contains(anotherUserId)) {
              total = total + 1;
            }
          },
        );
      });
      consolelog(total);
      if (total == 0) {
        return false;
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ConversationRequestModel>?> getConvos(String userId) async {
    try {
      List<ConversationRequestModel> conversationReqdata = [];
      await FirebaseConfig()
          .baseDb
          .collection('Convos')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            if (doc.get("members").contains(userId)) {
              conversationReqdata.add(
                ConversationRequestModel(
                    conversationId: doc.id,
                    fimage: doc.get("fimage"),
                    fname: doc.get("fname")),
              );
            }
          },
        );
      });
      return conversationReqdata;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
