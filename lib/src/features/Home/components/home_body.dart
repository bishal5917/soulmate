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

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        // consolelog(state);
        if (state.status == HomeStatus.success) {
          List<FeedRequestModel>? feedItems;
          feedItems = state.feedReqModel;
        }
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
            body: state.status == HomeStatus.fetching
                ? Padding(
                    padding: screenLeftRightPadding,
                    child: SafeArea(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return const CustomShimmerContainerWidget(
                              height: 300,
                              backgroundColor:
                                  Color.fromARGB(255, 222, 228, 230),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                            );
                          }),
                    ),
                  )
                : state.status == HomeStatus.success
                    ? SafeArea(
                        child: ListView.builder(
                            itemCount: state.feedReqModel?.length,
                            itemBuilder: (BuildContext context, int index) {
                              consolelog("state :: ${state.feedReqModel}");
                              return FeedItem(
                                state.feedReqModel?[index].name ?? "",
                                state.feedReqModel?[index].birthYear ?? "",
                                state.feedReqModel?[index].image ?? "",
                                state.feedReqModel?[index].hobby1 ?? "",
                                state.feedReqModel?[index].hobby2 ?? "",
                                state.feedReqModel?[index].hobby3 ?? "",
                              );
                            }),
                      )
                    : CustomText.ourText("data"),
            // bottomNavigationBar: BottomNavbar(),
          );
        },
      ),
    );
  }
}
