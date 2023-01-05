// To parse this JSON data, do
//
//     final addtruckvehiclemodel = addtruckvehiclemodelFromJson(jsonString);

import 'dart:convert';

Addtruckvehiclemodel addtruckvehiclemodelFromJson(String str) => Addtruckvehiclemodel.fromJson(json.decode(str));

String addtruckvehiclemodelToJson(Addtruckvehiclemodel data) => json.encode(data.toJson());

class Addtruckvehiclemodel {
  Addtruckvehiclemodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Addtruckvehiclemodel.fromJson(Map<String, dynamic> json) => Addtruckvehiclemodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
