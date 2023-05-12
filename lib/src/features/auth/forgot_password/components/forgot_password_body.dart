part of '../forgot_password_screen.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        consolelog(state);
        if (state.status == ForgotPasswordStatus.error) {
          CustomToasts.showToast(
              msg: stringModify().formatErrorMsg(state.message as String));
        }
        if (state.status == ForgotPasswordStatus.sent) {
          CustomToasts.showToast(
              msg: "Check your mail to reset password !", color: Colors.green);
          Future.delayed(const Duration(seconds: 2),
              () => navigate(context, const LoginScreen()));
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(appWidth(context), 60),
          child: const CustomMainAppBar(
            title: "Forgot Password",
          ),
        ),
        body: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: screenLeftRightPadding,
              child: Form(
                key: sl.get<ForgotPasswordCubit>().forgotPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(children: [
                      vSizedBox2andHalf,
                      CustomText.ourText(
                          "Enter your registered email to receive password reset link ! ",
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center),
                      vSizedBox2andHalf,
                      CustomTextFormField(
                        hintText: "Enter Your Email",
                        labelText: "Email",
                        controller: sl
                            .get<ForgotPasswordCubit>()
                            .forgotPasswordEmailController,
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
                      vSizedBox2andHalf,
                      state.status == ForgotPasswordStatus.submitting
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              height: 44,
                              width: appWidth(context),
                              child: ElevatedButton.icon(
                                icon: CustomText.ourText(
                                  "Send Code",
                                  color: Colors.white,
                                ),
                                label: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  sl.get<ForgotPasswordCubit>().sendOtpToMail();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
