import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/features/Chat/cubit/chat_cubit.dart';
import 'package:soulmate/src/features/Chat/widgets/convo_list_item.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/widgets/shimmer/custom_shimmer_container_widget.dart';

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
    final reqdWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state.status == ChatStatus.fetchingConversation
            ? ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return const CustomShimmerContainerWidget(
                    height: 90,
                    backgroundColor: Color.fromARGB(255, 222, 228, 230),
                    margin: EdgeInsets.only(top: 5, bottom: 25),
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  );
                })
            : ListView.builder(
                itemCount: state.convoRequestModel?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ConvoListItem(
                    "1",
                    state.convoRequestModel?[index].fname ?? "",
                    state.convoRequestModel?[index].conversationId ?? "",
                    state.convoRequestModel?[index].fimage ?? "",
                  );
                });
      },
    );

    // : Center(
    //   child: Text("No Conversations Yet !"),
    // );
  }
}
