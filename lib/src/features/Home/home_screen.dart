import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Home/cubit/home_cubit.dart';
import 'package:soulmate/src/features/Home/widgets/bottom_navbar.dart';
import 'package:soulmate/src/features/Home/widgets/feed_item.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/features/auth/login/cubit/login_cubit.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';

part 'components/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl.get<HomeCubit>().loadFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const HomeBody(),
        );
      },
    );
  }
}
