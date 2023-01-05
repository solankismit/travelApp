// To parse this JSON data, do
//
//     final cancelbookingmodel = cancelbookingmodelFromJson(jsonString);

import 'dart:convert';

Cancelbookingmodel cancelbookingmodelFromJson(String str) => Cancelbookingmodel.fromJson(json.decode(str));

String cancelbookingmodelToJson(Cancelbookingmodel data) => json.encode(data.toJson());

class Cancelbookingmodel {
  Cancelbookingmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Cancelbookingmodel.fromJson(Map<String, dynamic> json) => Cancelbookingmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
