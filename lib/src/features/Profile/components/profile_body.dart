part of '../profile_screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(appWidth(context), 60),
          child: const CustomMainAppBar(),
        ),
        body: const SingleChildScrollView(
          child: AddImage(true),
        ));
  }
}
