import 'package:flutter/material.dart';
import 'custom_text.dart';

class PaginatedBottomWidget extends StatelessWidget {
  final bool? hasReachedMax;
  final String? title;
  const PaginatedBottomWidget({
    Key? key,
    this.hasReachedMax = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasReachedMax == true
        ? Center(
            child: CustomText.ourText(
            "No more $title to load.",
            fontSize: 14.0,
          ))
        : const Center(
            child: SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          );
  }
}
