import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/widgets/custom_button.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    File? file;
    ImagePicker imgP = ImagePicker();

    getgall() async {
      // ignore: deprecated_member_use
      var img = await imgP.getImage(source: ImageSource.gallery);
      setState(() {
        // file = File(img.path);
        // registerDetail['profPic'] = img.path;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
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
                    shape: BoxShape.rectangle,
                  ),
                  child: file == null
                      ? Icon(
                          Icons.image,
                          size: 50,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(file!), radius: 20),
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
                          color: Color.fromARGB(255, 24, 122, 155),
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                      ),
                    ))
              ],
            ),
            vSizedBox1,
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
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
                    shape: BoxShape.rectangle,
                  ),
                  child: file == null
                      ? Icon(
                          Icons.image,
                          size: 50,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(file!), radius: 20),
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
                          color: Color.fromARGB(255, 24, 122, 155),
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                      ),
                    ))
              ],
            ),
            vSizedBox1,
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
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
                    shape: BoxShape.rectangle,
                  ),
                  child: file == null
                      ? Icon(
                          Icons.image,
                          size: 50,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(file!), radius: 20),
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
                          color: Color.fromARGB(255, 24, 122, 155),
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
        vSizedBox2,
        CustomButton.elevatedButton(
          "Next",
          () => {continued()},
          borderRadius: 10,
          color: OColors.kPrimaryMainColor,
          fontSize: 17,
        ),
      ],
    );
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }
}
