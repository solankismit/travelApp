// To parse this JSON data, do
//
//     final sendnotificationtopickparcelmodel = sendnotificationtopickparcelmodelFromJson(jsonString);

import 'dart:convert';

Sendnotificationtopickparcelmodel sendnotificationtopickparcelmodelFromJson(String str) => Sendnotificationtopickparcelmodel.fromJson(json.decode(str));

String sendnotificationtopickparcelmodelToJson(Sendnotificationtopickparcelmodel data) => json.encode(data.toJson());

class Sendnotificationtopickparcelmodel {
  Sendnotificationtopickparcelmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Sendnotificationtopickparcelmodel.fromJson(Map<String, dynamic> json) => Sendnotificationtopickparcelmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
