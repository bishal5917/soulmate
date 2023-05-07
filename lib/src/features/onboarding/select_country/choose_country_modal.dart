import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/features/onboarding/select_country/cubit/select_country_cubit.dart';
import 'package:soulmate/src/utils/country_flag.dart';
import 'package:soulmate/src/utils/debouncer.dart';
import 'package:soulmate/src/widgets/custom_text.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

chooseCountryModalBottomSheet({required BuildContext context}) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        initialChildSize: 0.5,
        builder: (context, scrollController) =>
            BlocBuilder<SelectCountryCubit, SelectCountryState>(
          builder: (context, state) {
            return state.status == CountryStatus.error
                ? Center(
                    child: CustomText.ourText(
                      "Not Found",
                      color: OColors.kErrorColor,
                    ),
                  )
                : state.status == CountryStatus.success
                    ? SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            vSizedBox2,
                            Padding(
                              padding: screenLeftRightPadding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText.ourText(
                                    "Select the country",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        // back(context);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                            ),
                            vSizedBox2,
                            Padding(
                              padding: screenLeftRightPadding,
                              child: CustomTextFormField(
                                hintText: "Search Your Country",
                                controller: sl
                                    .get<SelectCountryCubit>()
                                    .searchCountryController,
                                suffix: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                searchString: true,
                                isFromSearch: true,
                                onChanged: (val) {
                                  var searchRun = Debouncer(milliseconds: 200);
                                  searchRun.run(() {
                                    sl.get<SelectCountryCubit>().getCountries();
                                  });
                                },
                              ),
                            ),
                            vSizedBox2,
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.searchCountryModel?.length ?? 0,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      vSizedBox1,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  onTap: () {
                                    // sl
                                    //         .get<SelectCountryCubit>()
                                    //         .selectedCountryController
                                    //         .text =
                                    //     state.searchCountryModel?[index].name ??
                                    //         "";
                                    // // back(context);
                                  },
                                  leading: CustomText.ourText(
                                    countryFlag(
                                        state.searchCountryModel?[index].code ??
                                            ""),
                                  ),
                                  title: CustomText.ourText(
                                      state.searchCountryModel?[index].name,
                                      fontSize: 17),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    : Container();
          },
        ),
      );
    },
  );
}
