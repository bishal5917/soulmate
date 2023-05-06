part of '../forgot_password_screen.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(appWidth(context), 60),
        child: const CustomMainAppBar(
          title: "Forgot Password",
        ),
      ),
      body: SingleChildScrollView(
        padding: screenLeftRightPadding,
        child: Form(
          key: sl.get<ForgotPasswordCubit>().forgotPasswordFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(children: [
                vSizedBox2andHalf,
                CustomText.ourText("Enter your email to reset password",
                    fontWeight: FontWeight.w400),
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
                SizedBox(
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
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
