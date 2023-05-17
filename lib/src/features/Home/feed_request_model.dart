// To parse this JSON data, do
//
//     final feedRequestModel = feedRequestModelFromJson(jsonString);

import 'dart:convert';

FeedRequestModel feedRequestModelFromJson(String str) =>
    FeedRequestModel.fromJson(json.decode(str));

String feedRequestModelToJson(FeedRequestModel data) =>
    json.encode(data.toJson());

class FeedRequestModel {
  String? fid;
  String? name;
  String? birthYear;
  List<dynamic>? hobbies;
  String? phone;
  String? image;

  FeedRequestModel({
    this.fid,
    this.name,
    this.birthYear,
    this.hobbies,
    this.phone,
    this.image,
  });

  factory FeedRequestModel.fromJson(Map<String, dynamic> json) =>
      FeedRequestModel(
        fid: json["fid"],
        name: json["name"],
        birthYear: json["birthYear"],
        hobbies: json["hobbies"] == null
            ? []
            : List<dynamic>.from(json["hobbies"]!.map((x) => x)),
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "fid": fid,
        "name": name,
        "birthYear": birthYear,
        "hobbies":
            hobbies == null ? [] : List<dynamic>.from(hobbies!.map((x) => x)),
        "phone": phone,
        "image": image,
      };
}
