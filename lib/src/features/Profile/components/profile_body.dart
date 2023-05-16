part of '../profile_screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.loggingOut) {
          CustomToasts.showToast(msg: "Logging you out , please wait !");
        }
        if (state.status == LoginStatus.loggedOut) {
          navigateOffAllNamed(context, '/login');
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
              body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: screenLeftRightPadding,
                child: Column(
                  children: [
                    vSizedBox2andHalf,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.ourText("Levi Ackerman , 25",
                            fontWeight: FontWeight.w600, fontSize: 20),
                        IconButton(
                            onPressed: () {
                              sl.get<LoginCubit>().logOut();
                            },
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    vSizedBox2,
                    const AddImage(true),
                    vSizedBox2
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
