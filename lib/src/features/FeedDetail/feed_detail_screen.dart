import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Chat/cubit/chat_cubit.dart';
import 'package:soulmate/src/features/Profile/cubit/profile_cubit.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/utils/custom_toasts.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class FeedDetailScreen extends StatefulWidget {
  const FeedDetailScreen();

  @override
  State<FeedDetailScreen> createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  final bool isMarked = true;

  @override
  void initState() {
    sl.get<ProfileCubit>().getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        console(state);
        return BlocListener<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state.status == ChatStatus.created) {
              CustomToasts.showToast(msg: state.message, color: Colors.teal);
            }
            if (state.status == ChatStatus.error) {
              CustomToasts.showToast(msg: state.message);
            }
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, profState) {
              return Scaffold(
                  appBar: AppBar(
                    title: CustomText.ourText(args['fname'],
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                            args['fimage'] as String,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Hobbies",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 300,
                          width: 350,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Color.fromARGB(255, 216, 156, 151),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "travelling",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: state.status == ChatStatus.starting
                      ? FloatingActionButton(
                          backgroundColor: OColors.kPrimaryMainColor,
                          child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: BorderSide.strokeAlignCenter),
                          onPressed: () {},
                        )
                      : FloatingActionButton(
                          backgroundColor: OColors.kPrimaryMainColor,
                          child: Icon(
                            !isMarked
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                          ),
                          onPressed: () {
                            sl.get<ChatCubit>().createChat(
                                AppSharedPreferences.getUserId,
                                args['fid'] as String);
                          }));
            },
          ),
        );
      },
    );
  }
}
