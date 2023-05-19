import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/texts.dart';
import 'package:soulmate/src/core/states/states.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/utils/validation.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "Enter Your Email",
          labelText: "Email",
          controller: sl.get<LoginCubit>().loginEmailController,
          validator: (val) {
            if (val.toString().isEmptyData()) {
              return emptyText;
            } else if (!val.toString().isValidEmail()) {
              return validEmailText;
            } else {
              return null;
            }
          },
        ),
        vSizedBox2,
        ValueListenableBuilder<bool>(
          valueListenable: showPassswordVisibility,
          builder: (BuildContext context, bool isTrue, Widget? child) {
            return CustomTextFormField(
                hintText: "Enter Your Password",
                labelText: "Password",
                validator: (val) => val.toString().isEmptyData()
                    ? emptyText
                    : val.toString().isPasswordLength()
                        ? passwordLengthText
                        : null,
                obscureText: !showPassswordVisibility.value,
                controller: sl.get<LoginCubit>().loginPasswordController,
                suffix: IconButton(
                  onPressed: () {
                    showPassswordVisibility.value =
                        !showPassswordVisibility.value;
                  },
                  icon: showPassswordVisibility.value
                      ? Icon(
                          Icons.visibility,
                          color: OColors.kNeutral400Color,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: OColors.kNeutral400Color,
                        ),
                ));
          },
        ),
      ],
    );
  }
}
