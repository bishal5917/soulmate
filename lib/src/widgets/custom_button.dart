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
    Color? borderSideColor,
    double borderRadius = 3.0,
  }) {
    return SizedBox(
      width: width,
      height: height ?? 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: color ?? OColors.kPrimaryMainColor,
          disabledBackgroundColor: OColors.kNeutral100Color,
          disabledForegroundColor: OColors.kNeutral100Color,
          shape: RoundedRectangleBorder(
            // side:
            //     BorderSide(color: borderSideColor ?? OColors.kNeutral100Color),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
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
    FontStyle? fontStyle,
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
          backgroundColor: Colors.white,
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
                    fontStyle: fontStyle,
                  ),
                )
              : CustomText.ourText(
                  title,
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.w300,
                  color: titleColor ?? Colors.black,
                  fontStyle: fontStyle,
                ),
        ),
      ),
    );
  }

  static Widget elevatedButtonWithIcon(
      {Key? key,
      required Function()? onPressed,
      VoidCallback? onLongPress,
      ValueChanged<bool>? onHover,
      ValueChanged<bool>? onFocusChange,
      ButtonStyle? style,
      FocusNode? focusNode,
      bool? autofocus,
      Clip? clipBehavior,
      Color? backGroundColour,
      MaterialStatesController? statesController,
      double? width,
      required Widget icon,
      required Widget label}) {
    return SizedBox(
      height: 44,
      width: width ?? double.infinity,
      child: ElevatedButton.icon(
        icon: icon,
        label: label,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),
    );
  }

  static Widget textButtonWithIcon(
      {Key? key,
      required VoidCallback? onPressed,
      VoidCallback? onLongPress,
      ValueChanged<bool>? onHover,
      ValueChanged<bool>? onFocusChange,
      ButtonStyle? style,
      FocusNode? focusNode,
      bool? autofocus,
      Clip? clipBehavior,
      MaterialStatesController? statesController,
      required Widget icon,
      required Widget label,
      double borderRadius = 3.0}) {
    return SizedBox(
      // height: 44,
      width: 75,
      child: ElevatedButton.icon(
          icon: icon,
          label: label,
          onPressed: onPressed,
          style: TextButton.styleFrom(
            disabledBackgroundColor: Colors.grey.shade400,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
          )),
    );
  }
}
