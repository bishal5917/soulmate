import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:soulmate/src/core/app/medias.dart';
import 'package:soulmate/src/core/error/failures.dart';
import 'package:soulmate/src/features/onboarding/select_country/country_model.dart';

part 'select_country_state.dart';

class SelectCountryCubit extends Cubit<SelectCountryState> {
  SelectCountryCubit() : super(SelectCountryInitial());

  final TextEditingController _searchCountryController =
      TextEditingController();

  TextEditingController get searchCountryController => _searchCountryController;

  // Future<void> userLogin() async {
  //   emit(state.copyWith(status: CountryStatus.entering));
  //   try {

  //     emit(state.copyWith(
  //         status: CountryStatus.success, countryModel: response));
  //   } catch (err) {
  //     // print(e.toString());
  //     emit(state.copyWith(status: CountryStatus.error));
  //   }
  // }

  List<CountryModel> parseCountry(String responseBody) {
    final parsed = countryModelFromJson(responseBody);
    return parsed;
  }

  Future<String> loadDatas() async {
    var data = await rootBundle.loadString(CountriesJson);
    return data;
  }

  void getCountries() async {
    try {
      emit(state.copyWith(status: CountryStatus.entering));

      if (_searchCountryController.text.isNotEmpty) {
        List<CountryModel>? filteredSearchCountry =
            state.countryModel?.where((element) {
          return element.name?.toLowerCase().contains(
                  _searchCountryController.text.toLowerCase().trim()) ??
              false;
        }).toList();
        // filteredSearchCountry?.forEach((e) => consolelog(e.name));
        emit(state.copyWith(
          status: CountryStatus.success,
          countryModel: parseCountry(countryData ?? ""),
          searchCountryModel: filteredSearchCountry,
        ));
      } else {
        await loadDatas().then((value) {
          countryData = value;
          emit(state.copyWith(
            status: CountryStatus.success,
            countryModel: parseCountry(value),
          ));
        }).onError((error, stackTrace) {
          emit(state.copyWith(status: CountryStatus.error));
        });
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(status: CountryStatus.error));
    } catch (e) {
      emit(state.copyWith(status: CountryStatus.error));
    }
  }

  @override
  void reset() {
    _searchCountryController.clear();
  }
}
