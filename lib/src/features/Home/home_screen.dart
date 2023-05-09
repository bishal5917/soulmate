import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';

part 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const HomeBody());
  }
}
