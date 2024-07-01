// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  bool? success;
  int? status;
  String? message;
  Data? data;

  HomePageModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    success: json["success"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? profileImg;
  int? rewardPoints;
  String? roadmapProgress;

  Data({
    this.name,
    this.profileImg,
    this.rewardPoints,
    this.roadmapProgress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    profileImg: json["profileImg"],
    rewardPoints: json["reward_points"] ?? 0,
    roadmapProgress: json["roadmap_progress"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "profileImg": profileImg,
    "reward_points": rewardPoints,
    "roadmap_progress": roadmapProgress,
  };
}
