// To parse this JSON data, do
//
//     final sendparcelmodel = sendparcelmodelFromJson(jsonString);

import 'dart:convert';

Sendparcelmodel sendparcelmodelFromJson(String str) => Sendparcelmodel.fromJson(json.decode(str));

String sendparcelmodelToJson(Sendparcelmodel data) => json.encode(data.toJson());

class Sendparcelmodel {
  Sendparcelmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Sendparcelmodel.fromJson(Map<String, dynamic> json) => Sendparcelmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
