import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/medias.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/AddImage/add_image_screen.dart';
import 'package:soulmate/src/features/Home/home_screen.dart';
import 'package:soulmate/src/features/Register/user_register_screen.dart';
import 'package:soulmate/src/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/features/auth/reset_password/reset_password_screen.dart';
import 'package:soulmate/src/features/auth/widgets/login_form_widget.dart';
import 'package:soulmate/src/utils/String_modify.dart';
import 'package:soulmate/src/utils/custom_toasts.dart';
import 'package:soulmate/src/widgets/custom_button.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

import '../../../widgets/custom_home_appbar.dart';

part './components/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBody();
  }
}
