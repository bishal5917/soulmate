import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/features/AddImage/Widgets/add_image.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';

part './components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}
