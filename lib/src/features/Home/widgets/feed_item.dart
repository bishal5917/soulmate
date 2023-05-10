import 'package:flutter/material.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class FeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => selectMeal(context),
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
                    "https://akm-img-a-in.tosshub.com/sites/visualstory/stories/2022_07/story_8233/assets/2.jpeg?time=1656654025",
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
                    child: const Text(
                      "Johnny Depp , 25",
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
                    CustomText.ourText("Acting",
                        fontSize: 15, fontStyle: FontStyle.italic),
                    CustomText.ourText("Music",
                        fontSize: 15, fontStyle: FontStyle.italic),
                    CustomText.ourText("Adventure",
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
