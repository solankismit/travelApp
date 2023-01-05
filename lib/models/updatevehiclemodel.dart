// To parse this JSON data, do
//
//     final updatevehiclemodel = updatevehiclemodelFromJson(jsonString);

import 'dart:convert';

Updatevehiclemodel updatevehiclemodelFromJson(String str) => Updatevehiclemodel.fromJson(json.decode(str));

String updatevehiclemodelToJson(Updatevehiclemodel data) => json.encode(data.toJson());

class Updatevehiclemodel {
  Updatevehiclemodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Updatevehiclemodel.fromJson(Map<String, dynamic> json) => Updatevehiclemodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
