// To parse this JSON data, do
//
//     final acceptorrejecthirevehiclerequest = acceptorrejecthirevehiclerequestFromJson(jsonString);

import 'dart:convert';

Acceptorrejecthirevehiclerequest acceptorrejecthirevehiclerequestFromJson(String str) => Acceptorrejecthirevehiclerequest.fromJson(json.decode(str));

String acceptorrejecthirevehiclerequestToJson(Acceptorrejecthirevehiclerequest data) => json.encode(data.toJson());

class Acceptorrejecthirevehiclerequest {
  Acceptorrejecthirevehiclerequest({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory Acceptorrejecthirevehiclerequest.fromJson(Map<String, dynamic> json) => Acceptorrejecthirevehiclerequest(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
