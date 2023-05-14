// To parse this JSON data, do
//
//     final messageRequestModel = messageRequestModelFromJson(jsonString);

import 'dart:convert';

List<MessageRequestModel> messageRequestModelFromJson(String str) =>
    List<MessageRequestModel>.from(
        json.decode(str).map((x) => MessageRequestModel.fromJson(x)));

String messageRequestModelToJson(List<MessageRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageRequestModel {
  String? senderId;
  String? message;
  String? createdAt;

  MessageRequestModel({
    this.senderId,
    this.message,
    this.createdAt,
  });

  factory MessageRequestModel.fromJson(Map<String, dynamic> json) =>
      MessageRequestModel(
        senderId: json["senderId"],
        message: json["message"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "message": message,
        "createdAt": createdAt,
      };
}
