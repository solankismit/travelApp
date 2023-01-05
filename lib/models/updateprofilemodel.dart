// To parse this JSON data, do
//
//     final updateprofilemodel = updateprofilemodelFromJson(jsonString);

import 'dart:convert';

Updateprofilemodel updateprofilemodelFromJson(String str) => Updateprofilemodel.fromJson(json.decode(str));

String updateprofilemodelToJson(Updateprofilemodel data) => json.encode(data.toJson());

class Updateprofilemodel {
  Updateprofilemodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Updateprofilemodel.fromJson(Map<String, dynamic> json) => Updateprofilemodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
