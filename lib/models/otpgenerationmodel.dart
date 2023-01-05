// To parse this JSON data, do
//
//     final otpgenerationmodel = otpgenerationmodelFromJson(jsonString);

import 'dart:convert';

Otpgenerationmodel otpgenerationmodelFromJson(String str) => Otpgenerationmodel.fromJson(json.decode(str));

String otpgenerationmodelToJson(Otpgenerationmodel data) => json.encode(data.toJson());

class Otpgenerationmodel {
  Otpgenerationmodel({
    required this.status,
    required this.otp,
  });

  String status;
  String otp;

  factory Otpgenerationmodel.fromJson(Map<String, dynamic> json) => Otpgenerationmodel(
    status: json["status"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "otp": otp,
  };
}
