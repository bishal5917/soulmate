import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget? widget;
  const CustomShimmer({Key? key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(milliseconds: 1000),
        highlightColor: Colors.grey.shade50,
        baseColor: Colors.grey.shade200,
        enabled: true,
        child: widget ?? const CircularProgressIndicator());
  }
}
