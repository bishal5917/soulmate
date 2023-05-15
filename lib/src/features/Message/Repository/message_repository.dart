import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Message/Repository/base_message_repository.dart';
import 'package:soulmate/src/features/Message/models/message_request_model.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class MessageRepository extends BaseMessageRepository {
  @override
  Future<void> sendMessage(String conversationId, String senderId,
      String message, String sentTime) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      await FirebaseConfig()
          .baseDb
          .collection("Convos")
          .doc(conversationId)
          .collection("messages")
          .doc('$timestamp')
          .set({
        "senderId": senderId,
        "message": message,
        "createdAt": DateTime.now().toString()
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessageRequestModel>?> getMessages(String conversationId) async {
    try {
      List<MessageRequestModel> messageList = [];
      await FirebaseConfig()
          .baseDb
          .collection('Convos')
          .doc(conversationId)
          .collection("messages")
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            messageList.add(
              MessageRequestModel(
                  createdAt: doc.get("createdAt"),
                  message: doc.get("message"),
                  senderId: doc.get("senderId")),
            );
          },
        );
      });
      return messageList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
