import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomMainAppBar extends StatelessWidget {
  const CustomMainAppBar(
      {Key? key,
      this.title,
      this.titleFontSize = 20,
      this.action,
      this.isAutomaticallyImplyLeading,
      this.bgColor,
      this.leading})
      : super(key: key);
  final String? title;
  final double? titleFontSize;
  final List<Widget>? action;
  final Color? bgColor;
  final bool? isAutomaticallyImplyLeading;
  final Widget? leading;

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
      automaticallyImplyLeading: isAutomaticallyImplyLeading ?? true,
      elevation: 0,
      centerTitle: true,
      actions: action ?? [],
      backgroundColor: bgColor,
      leading: leading,
    );
  }
}
