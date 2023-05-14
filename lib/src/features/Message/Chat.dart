import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'dart:convert';
import 'dart:io';

import 'package:soulmate/src/features/Message/chat_sentences.dart';
import 'package:soulmate/src/features/Message/cubit/message_cubit.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/utils/String_modify.dart';
import 'package:soulmate/src/utils/custom_toasts.dart';
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
      duration: const Duration(microseconds: 5),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final argss =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      sl.get<MessageCubit>().retrieveMessages(argss['cid'] as String);
    });
  }

  Widget build(BuildContext context) {
    final argso =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    return BlocListener<MessageCubit, MessageState>(
      listener: (context, state) {
        if (state.status == MessageStatus.sent) {
          sl.get<MessageCubit>().resetControllers();
        }
        if (state.status == MessageStatus.error) {
          CustomToasts.showToast(
              msg: stringModify().formatErrorMsg(state.message as String));
        }
      },
      child: BlocBuilder<MessageCubit, MessageState>(
        builder: (context, state) {
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
                        itemCount: state.messageRequestModel?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Chat_Sentences(
                              argso['fPic'] as String,
                              state.messageRequestModel?[index].message ?? "",
                              state.messageRequestModel?[index].createdAt ?? "",
                              state.messageRequestModel?[index].senderId ?? "");
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
                          controller:
                              sl.get<MessageCubit>().messageInputController,
                          hintText: "Type a message",
                        )),
                        state.status == MessageStatus.sending
                            ? CircularProgressIndicator(
                                color: OColors.kPrimaryMainColor,
                              )
                            : IconButton(
                                color: OColors.kPrimaryMainColor,
                                onPressed: () {
                                  sl.get<MessageCubit>().sendMessages(
                                      argso['cid'] as String,
                                      AppSharedPreferences.getUserId);
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
        },
      ),
    );
  }
}
