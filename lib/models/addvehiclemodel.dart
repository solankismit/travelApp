// To parse this JSON data, do
//
//     final addvehiclemodel = addvehiclemodelFromJson(jsonString);

import 'dart:convert';

Addvehiclemodel addvehiclemodelFromJson(String str) => Addvehiclemodel.fromJson(json.decode(str));

String addvehiclemodelToJson(Addvehiclemodel data) => json.encode(data.toJson());

class Addvehiclemodel {
  Addvehiclemodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Addvehiclemodel.fromJson(Map<String, dynamic> json) => Addvehiclemodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
