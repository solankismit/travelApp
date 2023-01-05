// To parse this JSON data, do
//
//     final getbookingconfirmbyoffermodel = getbookingconfirmbyoffermodelFromJson(jsonString);

import 'dart:convert';

Getbookingconfirmbyoffermodel getbookingconfirmbyoffermodelFromJson(String str) => Getbookingconfirmbyoffermodel.fromJson(json.decode(str));

String getbookingconfirmbyoffermodelToJson(Getbookingconfirmbyoffermodel data) => json.encode(data.toJson());

class Getbookingconfirmbyoffermodel {
  Getbookingconfirmbyoffermodel({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Getbookingconfirmbyoffermodel.fromJson(Map<String, dynamic> json) => Getbookingconfirmbyoffermodel(
    status: json["status"],
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.name,
    required this.mobile,
    required this.userimage,
  });

  String name;
  String mobile;
  String userimage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    name: json["name"],
    mobile: json["mobile"],
    userimage: json["userimage"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "userimage": userimage,
  };
}
