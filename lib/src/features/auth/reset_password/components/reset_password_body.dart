part of '../reset_password_screen.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(appWidth(context), 60),
        child: const CustomMainAppBar(
          title: "Reset Password",
        ),
      ),
      body: SingleChildScrollView(
        padding: screenLeftRightPadding,
        child: Form(
            key: sl.get<ResetPasswordCubit>().resetPasswordFormKey,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Check your email at ",
                    style: TextStyle(
                      fontSize: 14,
                      color: OColors.kNeutral400Color,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "example@mail.com ",
                        style: TextStyle(
                          fontSize: 14,
                          color: OColors.kNeutral500Color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "for OTP code and reset your password",
                        style: TextStyle(
                          fontSize: 14,
                          color: OColors.kNeutral400Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                vSizedBox3,
                const ResetPasswordFormWidget(),
                vSizedBox2,
                SizedBox(
                  height: 45,
                  width: appWidth(context),
                  child: ElevatedButton.icon(
                    icon: CustomText.ourText(
                      "Reset Password",
                      color: Colors.white,
                    ),
                    label: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
