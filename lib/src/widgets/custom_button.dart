import 'package:flutter/material.dart';
import '../core/app/colors.dart';

import 'custom_text.dart';

class CustomButton {
  static Widget elevatedButton(
    String title,
    Function() onPressed, {
    Color? titleColor,
    double? width,
    EdgeInsets? padding,
    double? height,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFitted = false,
    bool isDisable = false,
    Color? color,
    double borderRadius = 3.0,
  }) {
    return SizedBox(
      width: width,
      height: height ?? 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: color ?? OColors.kPrimaryMainColor,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isDisable ? null : onPressed,
        child: Center(
          child: isFitted
              ? FittedBox(
                  child: CustomText.ourText(
                    title,
                    fontSize: fontSize,
                    fontWeight: fontWeight ?? FontWeight.w300,
                    color: titleColor ?? Colors.white,
                  ),
                )
              : CustomText.ourText(
                  title,
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.w300,
                  color: titleColor ?? Colors.white,
                ),
        ),
      ),
    );
  }

  static Widget textButton(
    String title,
    Function()? onPressed, {
    Color? titleColor,
    double? width,
    double? height,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFitted = false,
    bool isDisable = false,
    Color? color,
    double borderRadius = 3.0,
  }) {
    return SizedBox(
      width: width,
      height: height ?? 44,
      child: TextButton(
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isDisable ? null : onPressed,
        child: Center(
          child: isFitted
              ? FittedBox(
                  child: CustomText.ourText(
                    title,
                    fontSize: fontSize,
                    fontWeight: fontWeight ?? FontWeight.w300,
                    color: titleColor ?? Colors.black,
                  ),
                )
              : CustomText.ourText(
                  title,
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.w300,
                  color: titleColor ?? Colors.black,
                ),
        ),
      ),
    );
  }
}
