import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/features/Chat/widgets/convos_list.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';

part './components/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChatBody();
  }
}
