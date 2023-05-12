part of '../chat_screen.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(appWidth(context), 60),
        child: const CustomMainAppBar(
          action: [Icon(Icons.search_outlined)],
          title: "Chats",
        ),
      ),
      body: const ConvosList(),
    );
  }
}
