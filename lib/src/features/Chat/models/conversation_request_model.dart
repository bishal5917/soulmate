// To parse this JSON data, do
//
//     final conversationRequestModel = conversationRequestModelFromJson(jsonString);

import 'dart:convert';

ConversationRequestModel conversationRequestModelFromJson(String str) =>
    ConversationRequestModel.fromJson(json.decode(str));

String conversationRequestModelToJson(ConversationRequestModel data) =>
    json.encode(data.toJson());

class ConversationRequestModel {
  String? conversationId;
  String? fname;
  String? fimage;
  List<dynamic>? members;

  ConversationRequestModel({
    this.conversationId,
    this.fname,
    this.fimage,
    this.members,
  });

  factory ConversationRequestModel.fromJson(Map<String, dynamic> json) =>
      ConversationRequestModel(
        conversationId: json["conversationId"],
        fname: json["fname"],
        fimage: json["fimage"],
        members: json["members"] == null
            ? []
            : List<dynamic>.from(json["members"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "conversationId": conversationId,
        "fname": fname,
        "fimage": fimage,
        "members":
            members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
      };
}
