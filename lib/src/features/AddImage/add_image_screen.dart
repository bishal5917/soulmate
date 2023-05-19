import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/AddImage/Widgets/add_image.dart';
import 'package:soulmate/src/features/Home/home_screen.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/utils/String_modify.dart';
import 'package:soulmate/src/utils/custom_toasts.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(appWidth(context), 60),
          child: CustomMainAppBar(
            title: "Add Your Image",
          ),
        ),
        body: AddImage(false));
  }
}
