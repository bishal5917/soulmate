// To parse this JSON data, do
//
//     final feedRequestModel = feedRequestModelFromJson(jsonString);

import 'dart:convert';

List<FeedRequestModel> feedRequestModelFromJson(String str) =>
    List<FeedRequestModel>.from(
        json.decode(str).map((x) => FeedRequestModel.fromJson(x)));

String feedRequestModelToJson(List<FeedRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedRequestModel {
  String? fid;
  String? name;
  String? birthYear;
  String? hobby1;
  String? hobby2;
  String? hobby3;
  String? phone;
  String? image;

  FeedRequestModel({
    this.fid,
    this.name,
    this.birthYear,
    this.hobby1,
    this.hobby2,
    this.hobby3,
    this.phone,
    this.image,
  });

  factory FeedRequestModel.fromJson(Map<String, dynamic> json) =>
      FeedRequestModel(
        fid: json["fid"],
        name: json["name"],
        birthYear: json["birthYear"],
        hobby1: json["hobby1"],
        hobby2: json["hobby2"],
        hobby3: json["hobby3"],
        phone: json["Phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "fid": fid,
        "name": name,
        "birthYear": birthYear,
        "hobby1": hobby1,
        "hobby2": hobby2,
        "hobby3": hobby3,
        "Phone": phone,
        "image": image,
      };
}
