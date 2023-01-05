// To parse this JSON data, do
//
//     final forfotpassword = forfotpasswordFromJson(jsonString);

import 'dart:convert';

Forfotpassword forfotpasswordFromJson(String str) => Forfotpassword.fromJson(json.decode(str));

String forfotpasswordToJson(Forfotpassword data) => json.encode(data.toJson());

class Forfotpassword {
  Forfotpassword({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Forfotpassword.fromJson(Map<String, dynamic> json) => Forfotpassword(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
