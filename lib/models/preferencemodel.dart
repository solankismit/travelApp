// To parse this JSON data, do
//
//     final preferencemodel = preferencemodelFromJson(jsonString);

import 'dart:convert';

Preferencemodel preferencemodelFromJson(String str) => Preferencemodel.fromJson(json.decode(str));

String preferencemodelToJson(Preferencemodel data) => json.encode(data.toJson());

class Preferencemodel {
  Preferencemodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Preferencemodel.fromJson(Map<String, dynamic> json) => Preferencemodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}