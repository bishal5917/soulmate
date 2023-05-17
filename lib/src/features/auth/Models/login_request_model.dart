// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String? name;
  String? email;
  String? phone;
  String? birthYear;
  String? gender;
  List<dynamic>? hobbies;
  String? image;

  LoginRequestModel({
    this.name,
    this.email,
    this.phone,
    this.birthYear,
    this.gender,
    this.hobbies,
    this.image,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        birthYear: json["birthYear"],
        gender: json["gender"],
        hobbies: json["hobbies"] == null
            ? []
            : List<dynamic>.from(json["hobbies"]!.map((x) => x)),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "birthYear": birthYear,
        "gender": gender,
        "hobbies":
            hobbies == null ? [] : List<dynamic>.from(hobbies!.map((x) => x)),
        "image": image,
      };
}
