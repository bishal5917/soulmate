part of '../home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // consolelog(sl.get<HomeCubit>().feedItems.length);

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.success) {}
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size(appWidth(context), 60),
            //   child: CustomMainAppBar(
            //     title: AppSharedPreferences.getUserId,
            //   ),
            // ),
            body: SafeArea(
              child: state.status == HomeStatus.success
                  ? ListView.builder(
                      itemCount: sl.get<HomeCubit>().feedItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FeedItem(
                          sl.get<HomeCubit>().feedItems[index]!.name as String,
                          sl.get<HomeCubit>().feedItems[index]!.birthYear
                              as String,
                          sl.get<HomeCubit>().feedItems[index]!.image as String,
                          sl.get<HomeCubit>().feedItems[index]!.hobby1
                              as String,
                          sl.get<HomeCubit>().feedItems[index]!.hobby2
                              as String,
                          sl.get<HomeCubit>().feedItems[index]!.hobby3
                              as String,
                        );
                      })
                  : const CircularProgressIndicator(),
            ),
            // bottomNavigationBar: BottomNavbar(),
          );
        },
      ),
    );
  }
}
