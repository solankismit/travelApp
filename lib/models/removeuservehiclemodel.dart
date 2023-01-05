// To parse this JSON data, do
//
//     final removeuservehiclemodel = removeuservehiclemodelFromJson(jsonString);

import 'dart:convert';

Removeuservehiclemodel removeuservehiclemodelFromJson(String str) => Removeuservehiclemodel.fromJson(json.decode(str));

String removeuservehiclemodelToJson(Removeuservehiclemodel data) => json.encode(data.toJson());

class Removeuservehiclemodel {
  Removeuservehiclemodel({
    required this.status,
    required this.path,
    required this.msg,
  });

  String status;
  String path;
  String msg;

  factory Removeuservehiclemodel.fromJson(Map<String, dynamic> json) => Removeuservehiclemodel(
    status: json["status"],
    path: json["path"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": path,
    "msg": msg,
  };
}
