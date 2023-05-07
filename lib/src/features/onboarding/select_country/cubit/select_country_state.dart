part of 'select_country_cubit.dart';

enum CountryStatus { initial, entering, success ,error}

class SelectCountryState extends Equatable {
  final String? countryName;
  final CountryModel? countryModel;
  final CountryStatus? status;

  const SelectCountryState({this.countryName, this.countryModel, this.status});

  factory SelectCountryState.initial() {
    return const SelectCountryState(
        countryName: "", countryModel: null, status: CountryStatus.initial);
  }

  SelectCountryState copyWith(
      {String? countryName,
      CountryModel? countryModel,
      CountryStatus? status}) {
    return SelectCountryState(
      countryName: countryName ?? "",
      countryModel: countryModel ?? this.countryModel,
      status: status ?? this.status,
    );
  }

  @override
  List<dynamic> get props => [countryName, countryModel];
}

class SelectCountryInitial extends SelectCountryState {}
