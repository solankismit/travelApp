// To parse this JSON data, do
//
//     final removeschedulemodel = removeschedulemodelFromJson(jsonString);

import 'dart:convert';

Removeschedulemodel removeschedulemodelFromJson(String str) => Removeschedulemodel.fromJson(json.decode(str));

String removeschedulemodelToJson(Removeschedulemodel data) => json.encode(data.toJson());

class Removeschedulemodel {
  Removeschedulemodel({
    required this.status,
    required this.path,
    required this.msg,
  });

  String status;
  String path;
  String msg;

  factory Removeschedulemodel.fromJson(Map<String, dynamic> json) => Removeschedulemodel(
    status: json["status"],
    path: json["path"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": path,
    "msg": msg,
  };
}
