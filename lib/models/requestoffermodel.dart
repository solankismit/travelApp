// To parse this JSON data, do
//
//     final requestoffermodel = requestoffermodelFromJson(jsonString);

import 'dart:convert';

Requestoffermodel requestoffermodelFromJson(String str) => Requestoffermodel.fromJson(json.decode(str));

String requestoffermodelToJson(Requestoffermodel data) => json.encode(data.toJson());

class Requestoffermodel {
  Requestoffermodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Requestoffermodel.fromJson(Map<String, dynamic> json) => Requestoffermodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
