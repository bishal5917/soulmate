import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:soulmate/src/widgets/shimmer/custom_shimmer_container_widget.dart';

class FeedDetailScreen extends StatefulWidget {
  final String? fid;

  FeedDetailScreen(this.fid);

  @override
  State<FeedDetailScreen> createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  final bool isMarked = true;

  @override
  void initState() {
    sl.get<ProfileCubit>().getDetails(widget.fid ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              consolelog(profState.reqestedUser);
              return Scaffold(
                  appBar: AppBar(
                    title: CustomText.ourText(
                        profState.reqestedUser?.name ?? "",
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        profState.status == ProfileStatus.fetching
                            ? const CustomShimmerContainerWidget(
                                height: 300,
                                backgroundColor:
                                    Color.fromARGB(255, 222, 228, 230),
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 5, bottom: 10),
                              )
                            : Container(
                                padding: const EdgeInsets.all(10),
                                height: 300,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: profState.reqestedUser?.image ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                        SizedBox(
                          height: 300,
                          width: 350,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: profState.reqestedUser?.hobbies?.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: const Color.fromARGB(255, 216, 156, 151),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: CustomText.ourText(
                                      profState.reqestedUser?.hobbies?[index]),
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
                                  widget.fid as String,
                                );
                          }));
            },
          ),
        );
      },
    );
  }
}
