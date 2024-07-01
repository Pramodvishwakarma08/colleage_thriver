import '../../../core/app_export.dart';
import 'peoplecardgrid_item_model.dart';
import 'dart:convert';

/// This class defines the variables used in the [mentors_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MentorsModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<PeoplecardgridItemModel>> peoplecardgridItemList = Rx([
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame1752.obs,
        title: "Gretchen Rosser".obs,
        subtitle: "Web Dev".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame1752109x109.obs,
        title: "Jakob Culhane".obs,
        subtitle: "Android Dev".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17521.obs,
        title: "Corey Press".obs,
        subtitle: "Geography".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17522.obs,
        title: "Abram Bergson".obs,
        subtitle: "Psychology".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17523.obs,
        title: "Mira Calzoni".obs,
        subtitle: "Mathematic".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17524.obs,
        title: "Marcus Philips".obs,
        subtitle: "Electrical".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17525.obs,
        title: "Jaylon Lubin".obs,
        subtitle: "Economics ".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17526.obs,
        title: "Roger Mango".obs,
        subtitle: "Finance ".obs,
        description: "MIT Boston".obs),
    PeoplecardgridItemModel(
        userImage: ImageConstant.imgFrame17527.obs,
        title: "Cheyenne Torff".obs,
        subtitle: "UI/UX".obs,
        description: "MIT Boston".obs)
  ]);
}


// To parse this JSON data, do
//
//     final mentorModel = mentorModelFromJson(jsonString);


class MentorModel {
  bool? success;
  String? message;
  List<AllMentor>? allMentors;

  MentorModel({
    this.success,
    this.message,
    this.allMentors,
  });

  factory MentorModel.fromRawJson(String str) => MentorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel(
    success: json["success"],
    message: json["message"],
    allMentors: json["all_mentors"] == null ? [] : List<AllMentor>.from(json["all_mentors"]!.map((x) => AllMentor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "all_mentors": allMentors == null ? [] : List<dynamic>.from(allMentors!.map((x) => x.toJson())),
  };
}

class AllMentor {
  int? id;
  String? name;
  String? lname;
  String? profileImage;
  String? email;
  String? password;
  dynamic gender;
  String? dob;
  String? ethnicity;
  String? branch;
  String? clgName;
  dynamic hghSclName;
  dynamic schoolYear;
  dynamic gpa;
  dynamic groupAffiliation;
  dynamic graduationMonth;
  dynamic graduationYear;
  dynamic actToken;
  int? isActive;
  String? phoneNumber;
  String? address;
  int? zipCode;
  String? career;
  String? expertise;
  String? beforeMentored;
  String? mentorExperince;
  String? mentorName;
  String? contactWithMentor;
  String? additionalInfo;
  String? additionalResorce;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? timeFrom;
  String? timeTo;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllMentor({
    this.id,
    this.name,
    this.lname,
    this.profileImage,
    this.email,
    this.password,
    this.gender,
    this.dob,
    this.ethnicity,
    this.branch,
    this.clgName,
    this.hghSclName,
    this.schoolYear,
    this.gpa,
    this.groupAffiliation,
    this.graduationMonth,
    this.graduationYear,
    this.actToken,
    this.isActive,
    this.phoneNumber,
    this.address,
    this.zipCode,
    this.career,
    this.expertise,
    this.beforeMentored,
    this.mentorExperince,
    this.mentorName,
    this.contactWithMentor,
    this.additionalInfo,
    this.additionalResorce,
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
    this.createdAt,
    this.updatedAt,
  });

  factory AllMentor.fromRawJson(String str) => AllMentor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllMentor.fromJson(Map<String, dynamic> json) => AllMentor(
    id: json["id"],
    name: json["name"],
    lname: json["lname"],
    profileImage: json["profile_image"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    dob: json["dob"],
    ethnicity: json["ethnicity"],
    branch: json["branch"],
    clgName: json["clg_name"],
    hghSclName: json["hgh_scl_name"],
    schoolYear: json["school_year"],
    gpa: json["gpa"],
    groupAffiliation: json["group_affiliation"],
    graduationMonth: json["graduation_month"],
    graduationYear: json["graduation_year"],
    actToken: json["actToken"],
    isActive: json["is_active"],
    phoneNumber: json["PhoneNumber"],
    address: json["address"],
    zipCode: json["zip_code"],
    career: json["career"],
    expertise: json["expertise"],
    beforeMentored: json["beforeMentored"],
    mentorExperince: json["mentorExperince"],
    mentorName: json["MentorName"],
    contactWithMentor: json["contactWithMentor"],
    additionalInfo: json["additionalInfo"],
    additionalResorce: json["additionalResorce"],
    dateFrom: json["date_from"] == null ? null : DateTime.parse(json["date_from"]),
    dateTo: json["date_to"] == null ? null : DateTime.parse(json["date_to"]),
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lname": lname,
    "profile_image": profileImage,
    "email": email,
    "password": password,
    "gender": gender,
    "dob": dob,
    "ethnicity": ethnicity,
    "branch": branch,
    "clg_name": clgName,
    "hgh_scl_name": hghSclName,
    "school_year": schoolYear,
    "gpa": gpa,
    "group_affiliation": groupAffiliation,
    "graduation_month": graduationMonth,
    "graduation_year": graduationYear,
    "actToken": actToken,
    "is_active": isActive,
    "PhoneNumber": phoneNumber,
    "address": address,
    "zip_code": zipCode,
    "career": career,
    "expertise": expertise,
    "beforeMentored": beforeMentored,
    "mentorExperince": mentorExperince,
    "MentorName": mentorName,
    "contactWithMentor": contactWithMentor,
    "additionalInfo": additionalInfo,
    "additionalResorce": additionalResorce,
    "date_from": "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
    "date_to": "${dateTo!.year.toString().padLeft(4, '0')}-${dateTo!.month.toString().padLeft(2, '0')}-${dateTo!.day.toString().padLeft(2, '0')}",
    "time_from": timeFrom,
    "time_to": timeTo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
