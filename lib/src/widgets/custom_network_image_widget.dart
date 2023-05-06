import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/app/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    this.imageUrl,
    this.isProviderImage = false,
    this.width = 100,
    this.boxFit,
    this.height = 100,
    this.isAutoHeight = false,
    this.alignment,
  }) : super(key: key);
  final String? imageUrl;
  final bool isProviderImage;
  final bool isAutoHeight;
  final double width;
  final double height;
  final BoxFit? boxFit;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: isAutoHeight ? null : height,
      imageUrl: imageUrl ?? '',
      alignment: alignment ?? Alignment.center,
      fit: boxFit ?? BoxFit.cover,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: OColors.kPrimaryMainColor,
        ),
      ),
      errorWidget: (context, url, error) {
        return Image.network("");
      },
    );
  }
}

CachedNetworkImageProvider customNeworkImageProvider(String imageUrl) {
  return CachedNetworkImageProvider(
    imageUrl,
  );
}
