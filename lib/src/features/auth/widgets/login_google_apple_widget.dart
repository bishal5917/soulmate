import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/medias.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class LoginGoogleAppleWidget extends StatelessWidget {
  final bool? isGoogle;
  const LoginGoogleAppleWidget({super.key, this.isGoogle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 241, 235),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(isGoogle ?? false ? kGoogleSvg : kAppleSvg),
          hSizedBox1,
          CustomText.ourText(
            isGoogle ?? false ? "Continue with google" : "Continue with apple",
            fontSize: 14,
            color: OColors.kNeutral800Color,
          )
        ],
      ),
    );
  }
}
