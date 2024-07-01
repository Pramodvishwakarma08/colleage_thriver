// To parse this JSON data, do
//
//     final getyourCollegeMatchesModel = getyourCollegeMatchesModelFromJson(jsonString);

import 'dart:convert';

GetyourCollegeMatchesModel getyourCollegeMatchesModelFromJson(String str) => GetyourCollegeMatchesModel.fromJson(json.decode(str));

String getyourCollegeMatchesModelToJson(GetyourCollegeMatchesModel data) => json.encode(data.toJson());

class GetyourCollegeMatchesModel {
  bool? success;
  int? status;
  String? message;
  List<AllPoint>? allPoints;

  GetyourCollegeMatchesModel({
    this.success,
    this.status,
    this.message,
    this.allPoints,
  });

  factory GetyourCollegeMatchesModel.fromJson(Map<String, dynamic> json) => GetyourCollegeMatchesModel(
    success: json["success"],
    status: json["status"],
    message: json["message"],
    allPoints: json["all_points"] == null ? [] : List<AllPoint>.from(json["all_points"]!.map((x) => AllPoint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
    "all_points": allPoints == null ? [] : List<dynamic>.from(allPoints!.map((x) => x.toJson())),
  };
}

class AllPoint {
  int? id;
  int? userId;
  int? points11;
  int? points12;
  int? points13;
  int? points14;
  int? points21;
  int? points22;
  int? points23;
  int? points24;
  int? points31;
  int? points32;
  int? points33;
  int? points34;
  int? points35;
  int? allPoints;
  dynamic activity21;
  dynamic activity22;
  dynamic activity23;
  dynamic activity24;
  dynamic activity31;
  dynamic activity32;
  dynamic activity33;
  dynamic activity34;
  dynamic activity35;
  String? firstGen;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  int? collegeYear;
  String? collegeLocation;
  num? satScore;
  num? actScore;
  String? plannedMajor;
  String? socialActivities;
  String? attendType;
  String? householdIncome;
  String? militaryAffiliation;
  String? payCollege;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllPoint({
    this.id,
    this.userId,
    this.points11,
    this.points12,
    this.points13,
    this.points14,
    this.points21,
    this.points22,
    this.points23,
    this.points24,
    this.points31,
    this.points32,
    this.points33,
    this.points34,
    this.points35,
    this.allPoints,
    this.activity21,
    this.activity22,
    this.activity23,
    this.activity24,
    this.activity31,
    this.activity32,
    this.activity33,
    this.activity34,
    this.activity35,
    this.firstGen,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.collegeYear,
    this.collegeLocation,
    this.satScore,
    this.actScore,
    this.plannedMajor,
    this.socialActivities,
    this.attendType,
    this.householdIncome,
    this.militaryAffiliation,
    this.payCollege,
    this.createdAt,
    this.updatedAt,
  });

  factory AllPoint.fromJson(Map<String, dynamic> json) => AllPoint(
    id: json["id"],
    userId: json["user_id"],
    points11: json["points_11"],
    points12: json["points_12"],
    points13: json["points_13"],
    points14: json["points_14"],
    points21: json["points_21"],
    points22: json["points_22"],
    points23: json["points_23"],
    points24: json["points_24"],
    points31: json["points_31"],
    points32: json["points_32"],
    points33: json["points_33"],
    points34: json["points_34"],
    points35: json["points_35"],
    allPoints: json["all_points"],
    activity21: json["activity_21"],
    activity22: json["activity_22"],
    activity23: json["activity_23"],
    activity24: json["activity_24"],
    activity31: json["activity_31"],
    activity32: json["activity_32"],
    activity33: json["activity_33"],
    activity34: json["activity_34"],
    activity35: json["activity_35"],
    firstGen: json["first_gen"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    collegeYear: json["college_year"],
    collegeLocation: json["college_location"],
    satScore: json["sat_score"],
    actScore: json["act_score"],
    plannedMajor: json["planned_major"],
    socialActivities: json["social_activities"],
    attendType: json["attend_type"],
    householdIncome: json["household_income"],
    militaryAffiliation: json["military_affiliation"],
    payCollege: json["pay_college"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "points_11": points11,
    "points_12": points12,
    "points_13": points13,
    "points_14": points14,
    "points_21": points21,
    "points_22": points22,
    "points_23": points23,
    "points_24": points24,
    "points_31": points31,
    "points_32": points32,
    "points_33": points33,
    "points_34": points34,
    "points_35": points35,
    "all_points": allPoints,
    "activity_21": activity21,
    "activity_22": activity22,
    "activity_23": activity23,
    "activity_24": activity24,
    "activity_31": activity31,
    "activity_32": activity32,
    "activity_33": activity33,
    "activity_34": activity34,
    "activity_35": activity35,
    "first_gen": firstGen,
    "address": address,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "college_year": collegeYear,
    "college_location": collegeLocation,
    "sat_score": satScore,
    "act_score": actScore,
    "planned_major": plannedMajor,
    "social_activities": socialActivities,
    "attend_type": attendType,
    "household_income": householdIncome,
    "military_affiliation": militaryAffiliation,
    "pay_college": payCollege,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
