// To parse this JSON data, do
//
//     final viewProfileModel = viewProfileModelFromJson(jsonString);

import 'dart:convert';

ViewProfileModel viewProfileModelFromJson(String str) => ViewProfileModel.fromJson(json.decode(str));

String viewProfileModelToJson(ViewProfileModel data) => json.encode(data.toJson());

class ViewProfileModel {
  bool? success;
  int? status;
  String? message;
  List<Datum>? data;

  ViewProfileModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory ViewProfileModel.fromJson(Map<String, dynamic> json) => ViewProfileModel(
    success: json["success"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? lname;
  String? email;
  String? password;
  String ? profileImage;
  String? gender;
  String? dob;
  String? ethnicity;
  String? hghSclName;
  int ? schoolYear;
  double ? gpa;
  String? groupAffiliation;
  String? graduationMonth;
  int ? graduationYear;
  dynamic firstGen;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic collegeYear;
  dynamic collegeLocation;
  dynamic satScore;
  dynamic actScore;
  dynamic plannedMajor;
  dynamic socialActivities;
  dynamic attendType;
  dynamic householdIncome;
  dynamic militaryAffiliation;
  dynamic payCollege;
  String? actToken;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.lname,
    this.email,
    this.password,
    this.profileImage,
    this.gender,
    this.dob,
    this.ethnicity,
    this.hghSclName,
    this.schoolYear,
    this.gpa,
    this.groupAffiliation,
    this.graduationMonth,
    this.graduationYear,
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
    this.actToken,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    lname: json["lname"],
    email: json["email"],
    password: json["password"],
    profileImage: json["profile_image"],
    gender: json["gender"],
    dob: json["dob"],
    ethnicity: json["ethnicity"],
    hghSclName: json["hgh_scl_name"],
    schoolYear: json["school_year"],
    gpa: json["gpa"]?.toDouble(),
    groupAffiliation: json["group_affiliation"],
    graduationMonth: json["graduation_month"],
    graduationYear: json["graduation_year"],
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
    actToken: json["actToken"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lname": lname,
    "email": email,
    "password": password,
    "profile_image": profileImage,
    "gender": gender,
    "dob": dob,
    "ethnicity": ethnicity,
    "hgh_scl_name": hghSclName,
    "school_year": schoolYear,
    "gpa": gpa,
    "group_affiliation": groupAffiliation,
    "graduation_month": graduationMonth,
    "graduation_year": graduationYear,
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
    "actToken": actToken,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
