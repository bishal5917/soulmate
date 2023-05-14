import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:soulmate/src/features/Message/Repository/base_message_repository.dart';
import 'package:soulmate/src/utils/firebase_config.dart';

class MessageRepository extends BaseMessageRepository {
  @override
  Future<void> sendMessage(String conversationId, String senderId,
      String message, String sentTime) async {
    try {
      await FirebaseConfig()
          .baseDb
          .collection("Convos")
          .doc(conversationId)
          .collection("messages")
          .doc()
          .set({
        "senderId": senderId,
        "message": message,
        "createdAt": DateTime.now()
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<auth.User> get user => throw UnimplementedError();
}
