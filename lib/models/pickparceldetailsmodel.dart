// To parse this JSON data, do
//
//     final pickparceldetailsmodel = pickparceldetailsmodelFromJson(jsonString);

import 'dart:convert';

Pickparceldetailsmodel pickparceldetailsmodelFromJson(String str) => Pickparceldetailsmodel.fromJson(json.decode(str));

String pickparceldetailsmodelToJson(Pickparceldetailsmodel data) => json.encode(data.toJson());

class Pickparceldetailsmodel {
  Pickparceldetailsmodel({
    required this.status,
    required this.msg,
    required this.departureToDestination,
  });

  String status;
  String msg;
  dynamic departureToDestination;

  factory Pickparceldetailsmodel.fromJson(Map<String, dynamic> json) => Pickparceldetailsmodel(
    status: json["status"],
    msg: json["msg"],
    departureToDestination: json["departure_to_destination"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "departure_to_destination": departureToDestination,
  };
}
