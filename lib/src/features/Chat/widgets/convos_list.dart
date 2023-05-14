import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/features/Chat/cubit/chat_cubit.dart';
import 'package:soulmate/src/features/Chat/widgets/Message.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';

class ConvosList extends StatefulWidget {
  const ConvosList({super.key});

  @override
  State<ConvosList> createState() => _ConvosListState();
}

class _ConvosListState extends State<ConvosList> {
  @override
  void initState() {
    sl.get<ChatCubit>().retrieveConversations(AppSharedPreferences.getUserId);
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.convoRequestModel?.length,
            itemBuilder: (BuildContext context, int index) {
              return Message("1", state.convoRequestModel?[index].fname ?? "",
                  "1", state.convoRequestModel?[index].fimage ?? "");
            });
      },
    );

    // : Center(
    //   child: Text("No Conversations Yet !"),
    // );
  }
}
