import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/colors.dart';

class CustomTile {
  static Widget profileTile(
      {Key? key,
      required IconData? leadingIcon,
      required String title,
      Widget? trailing,
      int? index,
      Function()? onTap,
      Color? iconColor}) {
    return (ListTile(
      onTap: onTap,
      splashColor: OColors.backgroundColor,
      leading: Icon(
        leadingIcon,
        color: iconColor ?? OColors.kPrimaryMainColor,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios),
    ));
  }
}
