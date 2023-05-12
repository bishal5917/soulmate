import 'package:flutter/material.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class FeedItem extends StatelessWidget {
  final String name;
  final String age;
  final String image;
  final String hobby1;
  final String hobby2;
  final String hobby3;

  const FeedItem(
      this.name, this.age, this.image, this.hobby1, this.hobby2, this.hobby3);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => ,
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
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black45,
                    child: Text(
                      "$name , ${2023 - int.parse(age)}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
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
                        fontSize: 15, fontStyle: FontStyle.italic)
                    // Row(
                    //   children: [
                    //     Icon(Icons.schedule_rounded),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text("Acting"),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.work_outline),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text("Music"),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.attach_money_outlined),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text("Cleaning"),
                    //   ],
                    // )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
