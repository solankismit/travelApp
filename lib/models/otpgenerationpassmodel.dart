// To parse this JSON data, do
//
//     final otpgenerationpassmodel = otpgenerationpassmodelFromJson(jsonString);

import 'dart:convert';

Otpgenerationpassmodel otpgenerationpassmodelFromJson(String str) => Otpgenerationpassmodel.fromJson(json.decode(str));

String otpgenerationpassmodelToJson(Otpgenerationpassmodel data) => json.encode(data.toJson());

class Otpgenerationpassmodel {
  Otpgenerationpassmodel({
    required this.status,
    required this.otp,
  });

  String status;
  String otp;

  factory Otpgenerationpassmodel.fromJson(Map<String, dynamic> json) => Otpgenerationpassmodel(
    status: json["status"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "otp": otp,
  };
}
