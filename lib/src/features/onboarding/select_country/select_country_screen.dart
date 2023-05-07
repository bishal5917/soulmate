import 'package:flutter/material.dart';
import 'package:soulmate/src/features/onboarding/select_country/choose_country_modal.dart';
import 'package:soulmate/src/utils/double_tap_back.dart';
import 'package:soulmate/src/utils/validation.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

import '../../../core/app/dimensions.dart';
import '../../../core/app/texts.dart';
import '../../../widgets/custom_main_appbar.dart';
part './components/select_country_body.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return const WillPopScope(onWillPop: onWillPop, child: SelectCountryBody());
  }
}
