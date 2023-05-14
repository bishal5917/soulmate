import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';

class ConvoListItem extends StatefulWidget {
  final String userId;
  final String username;
  final String conversationId;
  final String profPic;

  ConvoListItem(this.userId, this.username, this.conversationId, this.profPic);

  @override
  State<ConvoListItem> createState() => _ConvoListItemState();
}

class _ConvoListItemState extends State<ConvoListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateNamed(context, '/open_chat', arguments: {
          "cid": widget.conversationId,
          "fname": widget.username,
          "fid": widget.userId,
          "fPic": widget.profPic
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: OColors.kPrimaryMainColor),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.profPic),
                radius: 36,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.username,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const Text("",
                          style: TextStyle(fontSize: 10, color: Colors.black54))
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Tap to open chat ...",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
