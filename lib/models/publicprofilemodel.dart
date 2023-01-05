// To parse this JSON data, do
//
//     final pubLicprofilemodel = pubLicprofilemodelFromJson(jsonString);

import 'dart:convert';

PubLicprofilemodel pubLicprofilemodelFromJson(String str) => PubLicprofilemodel.fromJson(json.decode(str));

String pubLicprofilemodelToJson(PubLicprofilemodel data) => json.encode(data.toJson());

class PubLicprofilemodel {
  PubLicprofilemodel({
    required this.status,
    required this.detail,
  });

  String status;
  Detail detail;

  factory PubLicprofilemodel.fromJson(Map<String, dynamic> json) => PubLicprofilemodel(
    status: json["status"],
    detail: Detail.fromJson(json["detail"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "detail": detail.toJson(),
  };
}

class Detail {
  Detail({
    required this.name,
    required this.userimage,
    required this.birth,
    required this.createdAt,
    required this.offers,
  });

  String name;
  String userimage;
  int birth;
  DateTime createdAt;
  int offers;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    name: json["name"],
    userimage: json["userimage"],
    birth: json["birth"],
    createdAt: DateTime.parse(json["created_at"]),
    offers: json["offers"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "userimage": userimage,
    "birth": birth,
    "created_at": createdAt.toIso8601String(),
    "offers": offers,
  };
}
