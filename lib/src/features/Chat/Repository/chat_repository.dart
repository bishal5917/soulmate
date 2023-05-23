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
  Future<void> createChat(String userId, String anotherUserId) async {
    try {
      await FirebaseConfig().baseDb.collection("Convos").doc().set({
        "members": [
          userId,
          anotherUserId,
        ]
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
      // await FirebaseConfig()
      //     .baseDb
      //     .collection('Convos')
      //     .get()
      //     .then((QuerySnapshot querySnapshot) {
      //   querySnapshot.docs.forEach(
      //     (doc) {
      //       if (doc.get("members").contains(userId)) {
      //         //getting the friendId
      //         String fId = doc.get("members").firstWhere((m) => m != userId);
      //         //fetching name and image of that friend
      //               final friendDetail = await FirebaseConfig().baseDb.collection("Users").doc(fId).get();
      //         conversationReqdata.add(
      //           ConversationRequestModel(
      //             conversationId: doc.id,
      //             fimage: friendDetail.get("fimage"),
      //             fname: friendDetail.get("fname"),
      //           ),
      //         );
      //       }
      //     },
      //   );

      CollectionReference collection =
          FirebaseFirestore.instance.collection('Convos');

      QuerySnapshot snapshot = await collection.get();

      if (snapshot.docs.isNotEmpty) {
        for (DocumentSnapshot doc in snapshot.docs) {
          if (doc.get("members").contains(userId)) {
            //getting the friendId
            dynamic fId = doc.get("members").firstWhere((m) => m != userId);
            //fetching name and image of that friend
            DocumentSnapshot friendDetail = await FirebaseConfig()
                .baseDb
                .collection("Users")
                .doc(fId)
                .get();
            // consolelog(friendDetail.);
            // consolelog(friendDetail.get("image"));
            if (friendDetail.exists) {
              conversationReqdata.add(
                ConversationRequestModel(
                  conversationId: doc.id,
                  fimage: friendDetail.get("image"),
                  fname: friendDetail.get("name"),
                ),
              );
            }
          }
        }
      }
      return conversationReqdata;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
