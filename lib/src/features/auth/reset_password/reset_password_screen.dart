import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:soulmate/src/features/auth/widgets/reset_password_form_widget.dart';
import 'package:soulmate/src/utils/double_tap_back.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

part './components/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WillPopScope(onWillPop: onWillPop, child: ResetPasswordBody());
  }
}
