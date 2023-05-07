part of '../select_country_screen.dart';

class SelectCountryBody extends StatefulWidget {
  const SelectCountryBody({Key? key}) : super(key: key);

  @override
  State<SelectCountryBody> createState() => _SelectCountryBodyState();
}

class _SelectCountryBodyState extends State<SelectCountryBody> {
  @override
  void initState() {
    sl.get<SelectCountryCubit>().getCountries();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(appWidth(context), 60),
        child: const CustomMainAppBar(
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
            hintText:
                sl.get<SelectCountryCubit>().selectedCountryController.text,
            isEnabled: false,
            suffix: const Icon(Icons.arrow_drop_down_circle_outlined),
          ),
        ),
      ),
    );
  }
}
