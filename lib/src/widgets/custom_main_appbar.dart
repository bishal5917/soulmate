import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class CustomMainAppBar extends StatelessWidget {
  const CustomMainAppBar({
    Key? key,
    this.title,
    this.titleFontSize = 20,
    this.action,
    this.leadingIcon,
    this.bgColor,
  }) : super(key: key);
  final String? title;
  final Icon? leadingIcon;
  final double? titleFontSize;
  final List<Widget>? action;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText.ourText(
        title ?? '',
        fontSize: titleFontSize,
        fontWeight: FontWeight.w600,
        maxLines: 1,
      ),
      // toolbarHeight: 200,
      automaticallyImplyLeading: true,
      // leading: leadingIcon,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.red, // Set the desired color for the back button
        onPressed: () {
          // Handle back button press
        },
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: bgColor,
      actions: action ?? [],
    );
  }
}
