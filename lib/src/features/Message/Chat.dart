import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'dart:convert';
import 'dart:io';

import 'package:soulmate/src/features/Message/chat_sentences.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(microseconds: 5),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final argso =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(argso['fname'] as String),
      ),
      body: Padding(
        padding: screenLeftRightPadding,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _controller,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Chat_Sentences(
                      "1",
                      "Its Ian",
                      "Very nice",
                      "Sat, 16 jun",
                      "2",
                    );
                  }),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 8),
              height: 70,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    hintText: "Type a message",
                  )),
                  IconButton(
                      color: OColors.kPrimaryMainColor,
                      onPressed: () {
                        _scrollDown();
                      },
                      iconSize: 35,
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
