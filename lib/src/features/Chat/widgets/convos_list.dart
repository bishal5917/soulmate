import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:soulmate/src/features/Chat/widgets/Message.dart';

class ConvosList extends StatefulWidget {
  const ConvosList({super.key});

  @override
  State<ConvosList> createState() => _ConvosListState();
}

class _ConvosListState extends State<ConvosList> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Message("1", "Sam Payne", "1", "image");
        });

    // : Center(
    //   child: Text("No Conversations Yet !"),
    // );
  }
}
