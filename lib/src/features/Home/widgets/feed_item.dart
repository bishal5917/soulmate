import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/development/console.dart';
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
  final List<dynamic> hobbies;
  final String phone;

  const FeedItem(
      this.fid, this.name, this.age, this.image, this.hobbies, this.phone);
  @override
  Widget build(BuildContext context) {
    consolelog(hobbies);
    return InkWell(
      onTap: () {
        navigateNamed(context, '/feed_detail',
            arguments: {"fid": fid, "fname": name, "fimage": image});
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
                    alignment: Alignment.center,
                    width: 350,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          "$name , ${2023 - int.parse(age)}",
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        // Container(
                        //   alignment: Alignment.bottomLeft,
                        //   child: Text(
                        //     phone,
                        //     style: const TextStyle(
                        //         fontSize: 15, color: Colors.white),
                        //     softWrap: true,
                        //     overflow: TextOverflow.fade,
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
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
                children: hobbies.map((dynamic hobby) {
                  return CustomText.ourText(hobby as String,
                      fontSize: 15, fontStyle: FontStyle.italic);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
