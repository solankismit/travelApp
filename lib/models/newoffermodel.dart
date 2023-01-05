// To parse this JSON data, do
//
//     final newoffermodel = newoffermodelFromJson(jsonString);

import 'dart:convert';

Newoffermodel newoffermodelFromJson(String str) => Newoffermodel.fromJson(json.decode(str));

String newoffermodelToJson(Newoffermodel data) => json.encode(data.toJson());

class Newoffermodel {
  Newoffermodel({
    required this.status,
    required this.msg,
    required this.departureToDestination,
    required this.seats,
  });

  String status;
  String msg;
  dynamic departureToDestination;
  String seats;

  factory Newoffermodel.fromJson(Map<String, dynamic> json) => Newoffermodel(
    status: json["status"],
    msg: json["msg"],
    departureToDestination: json["departure_to_destination"],
    seats: json["seats"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "departure_to_destination": departureToDestination,
    "seats": seats,
  };
}
