import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePhoto extends StatelessWidget {
  final String profImage;

  UserProfilePhoto(this.profImage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
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
            child: profImage.isNotEmpty
                ? CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: Image.network(
                        profImage,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  )
                : const CircleAvatar(child: Icon(Icons.accessible), radius: 20),
          ),
        ],
      ),
    );
  }
}
