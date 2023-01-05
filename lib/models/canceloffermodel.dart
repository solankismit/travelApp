// To parse this JSON data, do
//
//     final canceloffermodel = canceloffermodelFromJson(jsonString);

import 'dart:convert';

Canceloffermodel canceloffermodelFromJson(String str) => Canceloffermodel.fromJson(json.decode(str));

String canceloffermodelToJson(Canceloffermodel data) => json.encode(data.toJson());

class Canceloffermodel {
  Canceloffermodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Canceloffermodel.fromJson(Map<String, dynamic> json) => Canceloffermodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
