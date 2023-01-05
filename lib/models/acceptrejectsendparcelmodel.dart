// To parse this JSON data, do
//
//     final acceptrejectsendparcelmodel = acceptrejectsendparcelmodelFromJson(jsonString);

import 'dart:convert';

Acceptrejectsendparcelmodel acceptrejectsendparcelmodelFromJson(String str) => Acceptrejectsendparcelmodel.fromJson(json.decode(str));

String acceptrejectsendparcelmodelToJson(Acceptrejectsendparcelmodel data) => json.encode(data.toJson());

class Acceptrejectsendparcelmodel {
  Acceptrejectsendparcelmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Acceptrejectsendparcelmodel.fromJson(Map<String, dynamic> json) => Acceptrejectsendparcelmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
