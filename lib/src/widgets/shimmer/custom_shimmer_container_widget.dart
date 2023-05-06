import 'package:flutter/material.dart';

import '../../core/app/dimensions.dart';

class CustomShimmerContainerWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? widget;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final Color? borderColor;
  final BoxShape? shape;
  final bool? isBorder;
  const CustomShimmerContainerWidget({
    Key? key,
    this.backgroundColor,
    this.widget,
    this.borderWidth,
    this.borderRadius,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.borderColor,
    this.shape,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget != null
          ? null
          : BoxDecoration(
              color: backgroundColor ?? Colors.white,
              shape: shape == BoxShape.circle
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              border: shape == BoxShape.circle
                  ? null
                  : isBorder == true
                      ? Border.all(
                          color: borderColor ?? Colors.black,
                          width: borderWidth ?? 1,
                        )
                      : null,
              borderRadius: shape == BoxShape.circle
                  ? null
                  : BorderRadius.circular(borderRadius ?? 7.0),
            ),
      padding: widget != null
          ? (padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 11))
          : (padding ?? EdgeInsets.zero),
      margin: widget != null ? const EdgeInsets.only(bottom: 13) : margin,
      height: widget != null
          ? null
          : shape == BoxShape.circle
              ? (height ?? 50)
              : (height ?? 10),
      width: widget != null
          ? null
          : shape == BoxShape.circle
              ? (width ?? 50)
              : (width ?? appWidth(context)),
      child: widget ?? Container(),
    );
  }
}
