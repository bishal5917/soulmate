part of '../login_screen.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  String title = "Find Your Soulmate";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(appWidth(context), 60),
            child: CustomMainAppBar(
              title: title,
            ),
          ),
          body: SingleChildScrollView(
            padding: screenLeftRightPadding,
            child: Form(
              key: sl.get<LoginCubit>().loginFormKey,
              child: Column(
                children: [
                  vSizedBox2andHalf,
                  const LoginFormWidget(),
                  vSizedBox1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            navigate(context, const ForgotPasswordScreen());
                            // navigate(context, const ResetPasswordScreen());
                          },
                          child: CustomText.ourText("Forgot Password?",
                              color: Colors.redAccent)),
                    ],
                  ),
                  vSizedBox3,
                  state.status == LoginStatus.submitting
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          height: 44,
                          width: appWidth(context),
                          child: ElevatedButton.icon(
                            icon: CustomText.ourText(
                              "Continue",
                              color: Colors.white,
                            ),
                            label: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // print(sl.get<LoginCubit>().loginEmailController.text);
                              // if (state.status == LoginStatus.success) {
                              //   navigate(context, const ForgotPasswordScreen());
                              // }
                              sl.get<LoginCubit>().userLogin();
                              sl.get<LoginCubit>().reset();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                              ),
                            ),
                          ),
                        ),
                  state.status == LoginStatus.error
                      ? CustomToasts.showToast(
                          msg: state.message?.split(" ")[0].split("/")[1])
                      : const Text(""),
                  vSizedBox2andHalf,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          endIndent: 10,
                          thickness: 2,
                          color: OColors.kNeutral400Color,
                        ),
                      ),
                      CustomText.ourText(
                        "or",
                        color: OColors.kNeutral400Color,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          indent: 10,
                          color: OColors.kNeutral400Color,
                        ),
                      ),
                    ],
                  ),
                  vSizedBox2andHalf,
                  const LoginGoogleAppleWidget(isGoogle: true),
                  vSizedBox2,
                  vSizedBox2,
                  vSizedBox4,
                  RichText(
                    text: TextSpan(
                      text: "New to Soulmate?",
                      style: TextStyle(
                        fontSize: 14,
                        color: OColors.kNeutral400Color,
                      ),
                      children: [
                        TextSpan(
                          text: " Register",
                          style: TextStyle(
                            color: OColors.kPrimaryMainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSizedBox1,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By proceeding you will agree our ",
                      style: TextStyle(
                        fontSize: 12,
                        color: OColors.kNeutral400Color,
                      ),
                      children: [
                        TextSpan(
                          text: "Terms of Services ",
                          style: TextStyle(
                            color: OColors.kPrimaryMainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyle(
                            color: OColors.kNeutral400Color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(
                            color: OColors.kPrimaryMainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSizedBox2
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
