
import 'dart:convert';

import 'package:soulmate/src/utils/country_flag.dart';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  String? name;
  String? dialCode;
  String? code;

  CountryModel({
    this.name,
    this.dialCode,
    this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        dialCode: json["dial_code"],
        code: countryFlag(json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dial_code": dialCode,
        "code": code,
      };
}
