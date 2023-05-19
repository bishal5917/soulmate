import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Chat/widgets/convos_list.dart';
import 'package:soulmate/src/features/Home/cubit/home_cubit.dart';
import 'package:soulmate/src/features/Home/widgets/feed_item.dart';
import 'package:soulmate/src/features/Profile/profile_screen.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/widgets/custom_text.dart';
import 'package:soulmate/src/widgets/shimmer/custom_shimmer_container_widget.dart';

part 'components/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;
  final _pages = [const HomeBody(), const ConvosList(), const ProfileScreen()];
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, loginState) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: PageView(
                  allowImplicitScrolling: false,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedItem = index;
                    });
                  },
                  controller: _pageController,
                  children: _pages,
                ),
              ),
              bottomNavigationBar: Container(
                height: displayWidth * 0.155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: BottomNavigationBar(
                  selectedLabelStyle:
                      TextStyle(color: OColors.kPrimaryMainColor),
                  backgroundColor: OColors.kNeutral100Color,
                  iconSize: 25,
                  elevation: 1,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled,
                            color: OColors.kPrimaryMainColor),
                        label: "Feed"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite,
                            color: OColors.kPrimaryMainColor),
                        label: "Chats"),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined,
                          color: OColors.kPrimaryMainColor),
                      label: "Account",
                    )
                  ],
                  currentIndex: _selectedItem,
                  onTap: (index) {
                    setState(() {
                      _selectedItem = index;
                      _pageController.animateToPage(_selectedItem,
                          duration: const Duration(milliseconds: 2),
                          curve: Curves.linear);
                    });
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
