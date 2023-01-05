// To parse this JSON data, do
//
//     final checkotpmodel = checkotpmodelFromJson(jsonString);

import 'dart:convert';

Checkotpmodel checkotpmodelFromJson(String str) => Checkotpmodel.fromJson(json.decode(str));

String checkotpmodelToJson(Checkotpmodel data) => json.encode(data.toJson());

class Checkotpmodel {
  Checkotpmodel({
    required this.msg,
    required this.status,
    required this.type,
  });

  String msg;
  String status;
  String type;

  factory Checkotpmodel.fromJson(Map<String, dynamic> json) => Checkotpmodel(
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
