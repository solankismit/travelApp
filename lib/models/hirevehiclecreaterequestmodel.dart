// To parse this JSON data, do
//
//     final hirevehiclecreaterequestmodel = hirevehiclecreaterequestmodelFromJson(jsonString);

import 'dart:convert';

Hirevehiclecreaterequestmodel hirevehiclecreaterequestmodelFromJson(String str) => Hirevehiclecreaterequestmodel.fromJson(json.decode(str));

String hirevehiclecreaterequestmodelToJson(Hirevehiclecreaterequestmodel data) => json.encode(data.toJson());

class Hirevehiclecreaterequestmodel {
  Hirevehiclecreaterequestmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Hirevehiclecreaterequestmodel.fromJson(Map<String, dynamic> json) => Hirevehiclecreaterequestmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
