part of '../home_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    sl.get<HomeCubit>().loadFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // consolelog(sl.get<HomeCubit>().feedItems.length);

    return BlocBuilder<HomeCubit, HomeState>(
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
                    itemCount: sl.get<HomeCubit>().feedItems!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FeedItem(
                        sl.get<HomeCubit>().feedItems![index].name as String,
                        sl.get<HomeCubit>().feedItems![index].birthYear
                            as String,
                        sl.get<HomeCubit>().feedItems![index].image as String,
                        sl.get<HomeCubit>().feedItems![index].hobby1 as String,
                        sl.get<HomeCubit>().feedItems![index].hobby2 as String,
                        sl.get<HomeCubit>().feedItems![index].hobby3 as String,
                      );
                    })
                : const CircularProgressIndicator(),
          ),
          // bottomNavigationBar: BottomNavbar(),
        );
      },
    );
  }
}
