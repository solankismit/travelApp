// To parse this JSON data, do
//
//     final userregmodel = userregmodelFromJson(jsonString);

import 'dart:convert';

Userregmodel userregmodelFromJson(String str) => Userregmodel.fromJson(json.decode(str));

String userregmodelToJson(Userregmodel data) => json.encode(data.toJson());

class Userregmodel {
  Userregmodel({
    required this.status,
    required this.msg,
    required this.id,
  });

  String status;
  String msg;
  int? id;

  factory Userregmodel.fromJson(Map<String, dynamic> json) => Userregmodel(
    status: json["status"],
    msg: json["msg"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "id": id,
  };
}
