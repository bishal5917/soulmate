import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';

class Chat_Sentences extends StatelessWidget {
  // final String fid;
  final String fimage;
  final String text;
  final String date;
  final String senderId;

  Chat_Sentences(this.fimage, this.text, this.date, this.senderId);

  @override
  Widget build(BuildContext context) {
    return AppSharedPreferences.getUserId != senderId
        ? Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(fimage),
                      radius: 18,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          child: Center(
                              child: Text(
                            text,
                            textAlign: TextAlign.center,
                          ))),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(date,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black54)))
                    ],
                  ),
                ],
              ),
            ],
          )
        : Container(
            alignment: Alignment.topRight,
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.87),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topRight,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.40),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5)
                        ]),
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                    child: Text(date,
                        style: TextStyle(fontSize: 10, color: Colors.black54)))
              ],
            ),
          );
  }
}
