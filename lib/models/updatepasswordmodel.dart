// To parse this JSON data, do
//
//     final updatepasswordmodel = updatepasswordmodelFromJson(jsonString);

import 'dart:convert';

Updatepasswordmodel updatepasswordmodelFromJson(String str) => Updatepasswordmodel.fromJson(json.decode(str));

String updatepasswordmodelToJson(Updatepasswordmodel data) => json.encode(data.toJson());

class Updatepasswordmodel {
  Updatepasswordmodel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Updatepasswordmodel.fromJson(Map<String, dynamic> json) => Updatepasswordmodel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
