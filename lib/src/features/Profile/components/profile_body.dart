part of '../profile_screen.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    sl.get<ProfileCubit>().getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.status == ProfileStatus.loggingOut) {
          CustomToasts.showToast(msg: "Logging you out , please wait !");
        }
        if (state.status == ProfileStatus.loggedOut) {
          navigateOffAllNamed(context, '/login');
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
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
                        CustomText.ourText(
                            "${state.loggedUser?.name} , ${state.loggedUser?.birthYear}",
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                        IconButton(
                            onPressed: () {
                              sl.get<ProfileCubit>().logOut();
                            },
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    vSizedBox2,
                    AddImage(true, state.loggedUser?.image),
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
