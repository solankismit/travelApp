// To parse this JSON data, do
//
//     final setaddressmodel = setaddressmodelFromJson(jsonString);

import 'dart:convert';

Setaddressmodel setaddressmodelFromJson(String str) => Setaddressmodel.fromJson(json.decode(str));

String setaddressmodelToJson(Setaddressmodel data) => json.encode(data.toJson());

class Setaddressmodel {
  Setaddressmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Setaddressmodel.fromJson(Map<String, dynamic> json) => Setaddressmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
