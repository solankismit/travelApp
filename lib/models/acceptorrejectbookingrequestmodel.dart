// To parse this JSON data, do
//
//     final acceptorrejectbookingrequestmodel = acceptorrejectbookingrequestmodelFromJson(jsonString);

import 'dart:convert';

Acceptorrejectbookingrequestmodel acceptorrejectbookingrequestmodelFromJson(String str) => Acceptorrejectbookingrequestmodel.fromJson(json.decode(str));

String acceptorrejectbookingrequestmodelToJson(Acceptorrejectbookingrequestmodel data) => json.encode(data.toJson());

class Acceptorrejectbookingrequestmodel {
  Acceptorrejectbookingrequestmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Acceptorrejectbookingrequestmodel.fromJson(Map<String, dynamic> json) => Acceptorrejectbookingrequestmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
