// To parse this JSON data, do
//
//     final getaccountmodel = getaccountmodelFromJson(jsonString);

import 'dart:convert';

Getaccountmodel getaccountmodelFromJson(String str) => Getaccountmodel.fromJson(json.decode(str));

String getaccountmodelToJson(Getaccountmodel data) => json.encode(data.toJson());

class Getaccountmodel {
  Getaccountmodel({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Getaccountmodel.fromJson(Map<String, dynamic> json) => Getaccountmodel(
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
    required this.id,
    required this.userid,
    required this.bankname,
    required this.ifsc,
    required this.account,
    required this.country,
    required this.createdAt,
  });

  String id;
  String userid;
  String bankname;
  String ifsc;
  String account;
  String country;
  DateTime createdAt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    userid: json["userid"],
    bankname: json["bankname"],
    ifsc: json["ifsc"],
    account: json["account"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "bankname": bankname,
    "ifsc": ifsc,
    "account": account,
    "country": country,
    "created_at": createdAt.toIso8601String(),
  };
}
