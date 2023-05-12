import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/Chat/cubit/chat_cubit.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/widgets/custom_button.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class FeedItem extends StatelessWidget {
  final String fid;
  final String name;
  final String age;
  final String image;
  final String hobby1;
  final String hobby2;
  final String hobby3;
  final String phone;

  const FeedItem(this.fid, this.name, this.age, this.image, this.hobby1,
      this.hobby2, this.hobby3, this.phone);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Conversation must be created so that the logged in user can chat with that another user.

        // navigateNamed(context, "/open_chat", arguments: {
        //   "cid": widget.conversationId,
        //   "fname": name,
        //   "fid": fid
        // });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    image,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    width: 350,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "$name , ${2023 - int.parse(age)}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            phone,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText.ourText(hobby1,
                        fontSize: 15, fontStyle: FontStyle.italic),
                    CustomText.ourText(hobby2,
                        fontSize: 15, fontStyle: FontStyle.italic),
                    CustomText.ourText(hobby3,
                        fontSize: 15, fontStyle: FontStyle.italic),
                    IconButton(
                      onPressed: () {
                        sl.get<ChatCubit>().createChat(
                            AppSharedPreferences.getUserId, fid, name, image);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.red,
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
