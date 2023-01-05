// To parse this JSON data, do
//
//     final editparcelrmodel = editparcelrmodelFromJson(jsonString);

import 'dart:convert';

Editparcelrmodel editparcelrmodelFromJson(String str) => Editparcelrmodel.fromJson(json.decode(str));

String editparcelrmodelToJson(Editparcelrmodel data) => json.encode(data.toJson());

class Editparcelrmodel {
  Editparcelrmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Editparcelrmodel.fromJson(Map<String, dynamic> json) => Editparcelrmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
