part of '../home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // consolelog(sl.get<HomeCubit>().feedItems.length);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(appWidth(context), 60),
            child: CustomMainAppBar(
              title: AppSharedPreferences.getUserId,
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
                itemCount: sl.get<HomeCubit>().feedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return FeedItem();
                }),
          ),
          // bottomNavigationBar: BottomNavbar(),
        );
      },
    );
  }
}
