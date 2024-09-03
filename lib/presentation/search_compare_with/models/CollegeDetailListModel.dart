// To parse this JSON data, do
//
//     final collegeDetailListModel = collegeDetailListModelFromJson(jsonString);

import 'dart:convert';

CollegeDetailListModel collegeDetailListModelFromJson(String str) => CollegeDetailListModel.fromJson(json.decode(str));

String collegeDetailListModelToJson(CollegeDetailListModel data) => json.encode(data.toJson());

class CollegeDetailListModel {
  bool? success;
  int? status;
  int? recordCount;
  List<Message>? message;

  CollegeDetailListModel({
    this.success,
    this.status,
    this.recordCount,
    this.message,
  });

  factory CollegeDetailListModel.fromJson(Map<String, dynamic> json) => CollegeDetailListModel(
    success: json["success"],
    status: json["status"],
    recordCount: json["recordCount"],
    message: json["message"] == null ? [] : List<Message>.from(json["message"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "recordCount": recordCount,
    "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class Message {
  int? id;
  String? instnm;
  String? photo;
  String? city;
  Stabbr? stabbr;
  String? zip;
  String? insturl;
  String? npcurl;
  double? latitude;
  double? longitude;
  Hbcu? hbcu;
  String? menonly;
  String? womenonly;
  num? satAvg;
  int? actcmmid;
  int? admRate;
  String? costt4A;
  String? tuitionfeeIn;
  String? tuitionfeeOut;
  double? gpa;

  Message({
    this.id,
    this.instnm,
    this.photo,
    this.city,
    this.stabbr,
    this.zip,
    this.insturl,
    this.npcurl,
    this.latitude,
    this.longitude,
    this.hbcu,
    this.menonly,
    this.womenonly,
    this.satAvg,
    this.actcmmid,
    this.admRate,
    this.costt4A,
    this.tuitionfeeIn,
    this.tuitionfeeOut,
    this.gpa,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    instnm: json["instnm"],
    photo: json["photo"],
    city: json["city"],
    stabbr: stabbrValues.map[json["stabbr"]]!,
    zip: json["zip"],
    insturl: json["insturl"],
    npcurl: json["npcurl"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    hbcu: json["hbcu"] == null ? null : Hbcu.fromJson(json["hbcu"]),
    menonly: json["menonly"],
    womenonly: json["womenonly"],
    satAvg: json["sat_avg"],
    actcmmid: json["actcmmid"],
    admRate: json["adm_rate"],
    costt4A: json["costt4_a"],
    tuitionfeeIn: json["tuitionfee_in"],
    tuitionfeeOut: json["tuitionfee_out"],
    gpa: json["gpa"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "instnm": instnm,
    "photo": photo,
    "city": city,
    "stabbr": stabbrValues.reverse[stabbr],
    "zip": zip,
    "insturl": insturl,
    "npcurl": npcurl,
    "latitude": latitude,
    "longitude": longitude,
    "hbcu": hbcu?.toJson(),
    "menonly": menonly,
    "womenonly": womenonly,
    "sat_avg": satAvg,
    "actcmmid": actcmmid,
    "adm_rate": admRate,
    "costt4_a": costt4A,
    "tuitionfee_in": tuitionfeeIn,
    "tuitionfee_out": tuitionfeeOut,
    "gpa": gpa,
  };
}

class Hbcu {
  Type? type;
  List<int>? data;

  Hbcu({
    this.type,
    this.data,
  });

  factory Hbcu.fromJson(Map<String, dynamic> json) => Hbcu(
    type: typeValues.map[json["type"]]!,
    data: json["data"] == null ? [] : List<int>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}

enum Type {
  BUFFER
}

final typeValues = EnumValues({
  "Buffer": Type.BUFFER
});

enum Stabbr {
  AK,
  AL,
  AR,
  AZ,
  WA
}

final stabbrValues = EnumValues({
  "AK": Stabbr.AK,
  "AL": Stabbr.AL,
  "AR": Stabbr.AR,
  "AZ": Stabbr.AZ,
  "WA": Stabbr.WA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
