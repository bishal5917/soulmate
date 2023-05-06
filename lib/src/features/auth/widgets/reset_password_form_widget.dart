import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/texts.dart';
import 'package:soulmate/src/core/states/states.dart';
import 'package:soulmate/src/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:soulmate/src/utils/validation.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

class ResetPasswordFormWidget extends StatelessWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "Enter Your OTP",
          labelText: "OTP",
          controller: sl.get<ResetPasswordCubit>().resetPasswordOtpController,
          validator: (val) {
            if (val.toString().isOtpLength()) {
              return otpLengthText;
            } else if (!val.toString().isValidOtp()) {
              return invalidOTPText;
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
              hintText: "New Password",
              labelText: "Enter new password",
              validator: (val) => val.toString().isEmptyData()
                  ? emptyText
                  : val.toString().isPasswordLength()
                      ? passwordLengthText
                      : null,
              obscureText: !showPassswordVisibility.value,
              controller:
                  sl.get<ResetPasswordCubit>().resetPasswordPasswordController,
              suffix: GestureDetector(
                onTap: () {
                  showPassswordVisibility.value
                      ? showPassswordVisibility.value = false
                      : showPassswordVisibility.value = true;
                },
                child: showPassswordVisibility.value
                    ? Icon(
                        Icons.visibility,
                        color: OColors.kPrimaryMainColor,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: OColors.kPrimaryMainColor,
                      ),
              ),
            );
          },
        ),
        vSizedBox2,
        ValueListenableBuilder<bool>(
          valueListenable: showPassswordVisibility,
          builder: (BuildContext context, bool isTrue, Widget? child) {
            return CustomTextFormField(
              hintText: "Re-type new password",
              labelText: "Confirm password",
              validator: (val) => val.toString().isEmptyData()
                  ? emptyText
                  : val.toString().isSamePassword(sl
                          .get<ResetPasswordCubit>()
                          .resetPasswordPasswordController
                          .text)
                      ? passwordNotMatchedText
                      : null,
              obscureText: !showPassswordVisibility.value,
              controller: sl
                  .get<ResetPasswordCubit>()
                  .resetPasswordConfirmPasswordController,
              suffix: GestureDetector(
                onTap: () {
                  showPassswordVisibility.value
                      ? showPassswordVisibility.value = false
                      : showPassswordVisibility.value = true;
                },
                child: showPassswordVisibility.value
                    ? Icon(
                        Icons.visibility,
                        color: OColors.kPrimaryMainColor,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: OColors.kPrimaryMainColor,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
