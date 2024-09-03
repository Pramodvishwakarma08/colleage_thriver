import 'dart:convert';

class AllMessageModel {
  final bool? success;
  final String? message;
  final List<Message>? messages;

  AllMessageModel({
    this.success,
    this.message,
    this.messages,
  });

  factory AllMessageModel.fromRawJson(String str) => AllMessageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllMessageModel.fromJson(Map<String, dynamic> json) => AllMessageModel(
    success: json["success"],
    message: json["message"],
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  final int? id;
  final int? chatId;
  final int? senderId;
  final int? isMentor;
  final String? content;
  final String? createdOn;

  Message({
    this.id,
    this.chatId,
    this.senderId,
    this.isMentor,
    this.content,
    this.createdOn,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    chatId: json["chatId"],
    senderId: json["sender_id"],
    isMentor: json["isMentor"],
    content: json["content"],
    createdOn: json["createdOn"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chatId": chatId,
    "sender_id": senderId,
    "isMentor": isMentor,
    "content": content,
    "createdOn": createdOn,
  };
}
