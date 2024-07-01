// To parse this JSON data, do
//
//     final topStudentModel = topStudentModelFromJson(jsonString);

import 'dart:convert';

TopStudentModel topStudentModelFromJson(String str) => TopStudentModel.fromJson(json.decode(str));

String topStudentModelToJson(TopStudentModel data) => json.encode(data.toJson());

class TopStudentModel {
 bool? success;
 int? status;
 String? message;
 int? topstudentCount;
 List<Datum>? data;

 TopStudentModel({
  this.success,
  this.status,
  this.message,
  this.topstudentCount,
  this.data,
 });

 factory TopStudentModel.fromJson(Map<String, dynamic> json) => TopStudentModel(
  success: json["success"],
  status: json["status"],
  message: json["message"],
  topstudentCount: json["topstudentCount"],
  data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
 );

 Map<String, dynamic> toJson() => {
  "success": success,
  "status": status,
  "message": message,
  "topstudentCount": topstudentCount,
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
 };
}

class Datum {
 int? id;
 int? userId;
 int? allPoints;
 String? fullname;
 String? titleClg;
 String? profileImage;

 Datum({
  this.id,
  this.userId,
  this.allPoints,
  this.fullname,
  this.titleClg,
  this.profileImage,
 });

 factory Datum.fromJson(Map<String, dynamic> json) => Datum(
  id: json["id"],
  userId: json["user_id"],
  allPoints: json["all_points"],
  fullname: json["fullname"],
  titleClg: json["title_clg"],
  profileImage: json["profile_image"],
 );

 Map<String, dynamic> toJson() => {
  "id": id,
  "user_id": userId,
  "all_points": allPoints,
  "fullname": fullname,
  "title_clg": titleClg,
  "profile_image": profileImage,
 };
}
