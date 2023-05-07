part of 'select_country_cubit.dart';

enum CountryStatus { initial, entering, success, error }

class SelectCountryState extends Equatable {
  final String? countryName;
  final List<CountryModel>? countryModel;
  final List<CountryModel>? searchCountryModel;
  final CountryStatus? status;
  final String? message;

  const SelectCountryState(
      {this.countryName,
      this.countryModel,
      this.searchCountryModel,
      this.status,
      this.message});

  factory SelectCountryState.initial() {
    return const SelectCountryState(
        countryName: "",
        countryModel: null,
        searchCountryModel: null,
        status: CountryStatus.initial,
        message: "");
  }

  SelectCountryState copyWith(
      {String? countryName,
      List<CountryModel>? countryModel,
      List<CountryModel>? searchCountryModel,
      CountryStatus? status,
      String? message}) {
    return SelectCountryState(
        countryName: countryName ?? "",
        countryModel: countryModel ?? this.countryModel,
        searchCountryModel: searchCountryModel ?? this.searchCountryModel,
        status: status ?? this.status,
        message: message ?? "");
  }

  @override
  List<dynamic> get props =>
      [countryName, countryModel, searchCountryModel, status, message];
}

class SelectCountryInitial extends SelectCountryState {}
