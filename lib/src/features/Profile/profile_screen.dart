import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/AddImage/Widgets/add_image.dart';
import 'package:soulmate/src/features/AddImage/add_image_screen.dart';
import 'package:soulmate/src/features/Profile/cubit/profile_cubit.dart';
import 'package:soulmate/src/features/Profile/widgets/profile_photo.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/login/login_screen.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/utils/custom_toasts.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';
import 'package:soulmate/src/widgets/custom_text.dart';
import 'package:soulmate/src/widgets/custom_tile.dart';

part './components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}
