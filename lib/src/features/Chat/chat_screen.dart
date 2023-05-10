import 'package:flutter/material.dart';

part './components/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatBody();
  }
}
