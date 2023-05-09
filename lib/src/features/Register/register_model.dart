import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? name;
  String? email;
  String? phone;
  String? birthYear;
  String? gender;
  String? hobby1;
  String? hobby2;
  String? hobby3;
  String? password;

  RegisterModel({
    this.name,
    this.email,
    this.phone,
    this.birthYear,
    this.gender,
    this.hobby1,
    this.hobby2,
    this.hobby3,
    this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        birthYear: json["birthYear"],
        gender: json["gender"],
        hobby1: json["hobby1"],
        hobby2: json["hobby2"],
        hobby3: json["hobby3"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "birthYear": birthYear,
        "gender": gender,
        "hobby1": hobby1,
        "hobby2": hobby2,
        "hobby3": hobby3,
        "password": password,
      };
}
