part of '../home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(appWidth(context), 60),
          child: CustomMainAppBar(
            title: "My Feed",
          ),
        ),
        body: Text("Home Page"));
  }
}
