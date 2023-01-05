// To parse this JSON data, do
//
//     final bookingmodel = bookingmodelFromJson(jsonString);

import 'dart:convert';

Bookingmodel bookingmodelFromJson(String str) => Bookingmodel.fromJson(json.decode(str));

String bookingmodelToJson(Bookingmodel data) => json.encode(data.toJson());

class Bookingmodel {
  Bookingmodel({
    this.status,
    this.msg,
  });

  String? status;
  String? msg;

  factory Bookingmodel.fromJson(Map<String, dynamic> json) => Bookingmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
