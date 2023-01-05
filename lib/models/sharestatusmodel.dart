// To parse this JSON data, do
//
//     final sharestatusmodel = sharestatusmodelFromJson(jsonString);

import 'dart:convert';

Sharestatusmodel sharestatusmodelFromJson(String str) => Sharestatusmodel.fromJson(json.decode(str));

String sharestatusmodelToJson(Sharestatusmodel data) => json.encode(data.toJson());

class Sharestatusmodel {
  Sharestatusmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Sharestatusmodel.fromJson(Map<String, dynamic> json) => Sharestatusmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
