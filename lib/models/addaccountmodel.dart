// To parse this JSON data, do
//
//     final addaccountmodel = addaccountmodelFromJson(jsonString);

import 'dart:convert';

Addaccountmodel addaccountmodelFromJson(String str) => Addaccountmodel.fromJson(json.decode(str));

String addaccountmodelToJson(Addaccountmodel data) => json.encode(data.toJson());

class Addaccountmodel {
  Addaccountmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Addaccountmodel.fromJson(Map<String, dynamic> json) => Addaccountmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
