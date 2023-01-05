// To parse this JSON data, do
//
//     final givedriverratemodel = givedriverratemodelFromJson(jsonString);

import 'dart:convert';

Givedriverratemodel givedriverratemodelFromJson(String str) => Givedriverratemodel.fromJson(json.decode(str));

String givedriverratemodelToJson(Givedriverratemodel data) => json.encode(data.toJson());

class Givedriverratemodel {
  Givedriverratemodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Givedriverratemodel.fromJson(Map<String, dynamic> json) => Givedriverratemodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
