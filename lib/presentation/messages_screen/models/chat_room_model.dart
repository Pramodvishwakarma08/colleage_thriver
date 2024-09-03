import 'dart:convert';

class ChatRoomModel {
  final bool? success;
  final int? status;
  final String? message;
  final Chat? chat;
  final String? mentorName;
  final String? mentorProfile;

  ChatRoomModel({
    this.success,
    this.status,
    this.message,
    this.chat,
    this.mentorName,
    this.mentorProfile,
  });

  factory ChatRoomModel.fromRawJson(String str) => ChatRoomModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
    success: json["success"],
    status: json["status"],
    message: json["message"],
    chat: json["chat"] == null ? null : Chat.fromJson(json["chat"]),
    mentorName: json["mentor_name"],
    mentorProfile: json["mentor_profile_url"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
    "chat": chat?.toJson(),
    "mentor_name": mentorName,
    "mentor_profile_url": mentorProfile,
  };
}

class Chat {
  final int? id;
  final int? mentorId;
  final int? userId;
  final String? createdAt;

  Chat({
    this.id,
    this.mentorId,
    this.userId,
    this.createdAt,
  });

  factory Chat.fromRawJson(String str) => Chat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    mentorId: json["mentor_id"],
    userId: json["user_id"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mentor_id": mentorId,
    "user_id": userId,
    "created_at": createdAt,
  };
}
