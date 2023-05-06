import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/texts.dart';
import 'package:soulmate/src/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:soulmate/src/utils/validation.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';
import 'package:soulmate/src/widgets/custom_text.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

part './components/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordBody();
  }
}
