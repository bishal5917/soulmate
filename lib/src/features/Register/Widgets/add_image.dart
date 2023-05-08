import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? file;
  ImagePicker imgP = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 200,
              height: 200,
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
              child: file == null
                  ? const Icon(
                      Icons.image_outlined,
                      size: 50,
                    )
                  : CircleAvatar(
                      backgroundImage:
                          FileImage(sl.get<RegisterCubit>().image1),
                      radius: 30),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () async {
                    var img = await imgP.pickImage(source: ImageSource.gallery);
                    sl.get<RegisterCubit>().setImage1 = img!.path;
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.black26),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.red,
                    ),
                  ),
                ))
          ],
        ),
        Stack(
          children: [
            Container(
              width: 200,
              height: 200,
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
              child: file == null
                  ? const Icon(
                      Icons.image_outlined,
                      size: 50,
                    )
                  : CircleAvatar(
                      backgroundImage:
                          FileImage(sl.get<RegisterCubit>().image1),
                      radius: 30),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    // getgall();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.black26),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.red,
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
