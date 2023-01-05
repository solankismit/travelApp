// To parse this JSON data, do
//
//     final hirevehicleaddbidrateModel = hirevehicleaddbidrateModelFromJson(jsonString);

import 'dart:convert';

HirevehicleaddbidrateModel hirevehicleaddbidrateModelFromJson(String str) => HirevehicleaddbidrateModel.fromJson(json.decode(str));

String hirevehicleaddbidrateModelToJson(HirevehicleaddbidrateModel data) => json.encode(data.toJson());

class HirevehicleaddbidrateModel {
  HirevehicleaddbidrateModel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory HirevehicleaddbidrateModel.fromJson(Map<String, dynamic> json) => HirevehicleaddbidrateModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
