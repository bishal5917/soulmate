import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/features/AddImage/cubit/local_image_cubit.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/widgets/custom_button.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class AddImage extends StatelessWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalImageCubit, LocalImageState>(
      builder: (context, state) {
        // print(state);
        return Padding(
          padding: screenLeftRightPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: state.status == LocalImageStatus.success
                          ? CircleAvatar(
                              backgroundImage: FileImage(File(
                                  sl.get<LocalImageCubit>().localImage!.path)),
                              radius: 30)
                          : const Icon(
                              Icons.image_outlined,
                              size: 50,
                            ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            sl.get<LocalImageCubit>().pickImage(1);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black26),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              CustomButton.elevatedButtonWithIcon(
                  onPressed: () {},
                  icon: CustomText.ourText("Continue to App",
                      color: Colors.white, fontSize: 14),
                  label: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  backGroundColour: OColors.kPrimaryMainColor),
            ],
          ),
        );
      },
    );
  }
}
