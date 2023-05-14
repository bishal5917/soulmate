// To parse this JSON data, do
//
//     final conversationRequestModel = conversationRequestModelFromJson(jsonString);

import 'dart:convert';

List<ConversationRequestModel> conversationRequestModelFromJson(String str) =>
    List<ConversationRequestModel>.from(
        json.decode(str).map((x) => ConversationRequestModel.fromJson(x)));

String conversationRequestModelToJson(List<ConversationRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConversationRequestModel {
  String? conversationId;
  String? fimage;
  String? fname;

  ConversationRequestModel({
    this.conversationId,
    this.fimage,
    this.fname,
  });

  factory ConversationRequestModel.fromJson(Map<String, dynamic> json) =>
      ConversationRequestModel(
        conversationId: json["conversationId"],
        fimage: json["fimage"],
        fname: json["fname"],
      );

  Map<String, dynamic> toJson() => {
        "conversationId": conversationId,
        "fimage": fimage,
        "fname": fname,
      };
}
