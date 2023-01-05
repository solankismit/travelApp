// To parse this JSON data, do
//
//     final addvehicledocmodel = addvehicledocmodelFromJson(jsonString);

import 'dart:convert';

Addvehicledocmodel addvehicledocmodelFromJson(String str) => Addvehicledocmodel.fromJson(json.decode(str));

String addvehicledocmodelToJson(Addvehicledocmodel data) => json.encode(data.toJson());

class Addvehicledocmodel {
  Addvehicledocmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Addvehicledocmodel.fromJson(Map<String, dynamic> json) => Addvehicledocmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
