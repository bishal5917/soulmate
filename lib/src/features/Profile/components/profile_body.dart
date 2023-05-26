part of '../profile_screen.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final Map<String, IconData> profileOptionIconMap = {
    "Edit Avatar": Icons.image,
    "Edit Profile": Icons.edit_outlined,
    "Notifications": Icons.notifications_outlined,
    "Share Image": Icons.add_a_photo_outlined,
    "Account Security": Icons.security_outlined,
    "Logout": Icons.logout_outlined,
  };

  @override
  void initState() {
    sl.get<ProfileCubit>().getDetails(AppSharedPreferences.getUserId);
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
            appBar: PreferredSize(
              preferredSize: Size(appWidth(context), 30),
              child: const CustomMainAppBar(),
            ),
            body: Padding(
              padding: screenLeftRightPadding,
              child: Column(
                children: [
                  UserProfilePhoto(state.reqestedUser?.image ?? ""),
                  vSizedBox1,
                  CustomText.ourText(
                      "${state.reqestedUser?.name} , ${state.reqestedUser?.birthYear}",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  vSizedBox2,
                  Expanded(
                    child: ListView.builder(
                        itemCount: profileOptionIconMap.keys.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomTile.profileTile(
                              onTap: () {
                                if (index == 5) {
                                  sl.get<ProfileCubit>().logOut();
                                }
                                if (index == 0) {
                                  navigate(
                                    context,
                                    AddImage(true),
                                  );
                                }
                              },
                              index: index,
                              iconColor: index == 5
                                  ? Colors.red
                                  : OColors.kPrimaryMainColor,
                              leadingIcon: profileOptionIconMap[
                                  profileOptionIconMap.keys.elementAt(index)],
                              title:
                                  profileOptionIconMap.keys.elementAt(index));
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
