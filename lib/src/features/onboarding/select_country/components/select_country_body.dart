part of '../select_country_screen.dart';

class SelectCountryBody extends StatelessWidget {
  const SelectCountryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(appWidth(context), 60),
        child: CustomMainAppBar(
          title: "Select Your Country",
        ),
      ),
      body: Padding(
        padding: screenLeftRightPadding,
        child: GestureDetector(
          onTap: () {
            chooseCountryModalBottomSheet(context: context);
          },
          child: CustomTextFormField(
            hintText: "Select Country",
            isEnabled: false,
            suffix: const Icon(Icons.arrow_drop_down_circle_outlined),
          ),
        ),
      ),
    );
  }
}
