// To parse this JSON data, do
//
//     final checkotppassmodel = checkotppassmodelFromJson(jsonString);

import 'dart:convert';

Checkotppassmodel checkotppassmodelFromJson(String str) => Checkotppassmodel.fromJson(json.decode(str));

String checkotppassmodelToJson(Checkotppassmodel data) => json.encode(data.toJson());

class Checkotppassmodel {
  Checkotppassmodel({
    required this.msg,
    required this.status,
    required this.type,
  });

  String msg;
  String status;
  String type;

  factory Checkotppassmodel.fromJson(Map<String, dynamic> json) => Checkotppassmodel(
    msg: json["msg"],
    status: json["status"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
    "type": type,
  };
}
