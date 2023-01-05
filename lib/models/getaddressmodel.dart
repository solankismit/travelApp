// To parse this JSON data, do
//
//     final getaddressmodel = getaddressmodelFromJson(jsonString);

import 'dart:convert';

Getaddressmodel getaddressmodelFromJson(String str) => Getaddressmodel.fromJson(json.decode(str));

String getaddressmodelToJson(Getaddressmodel data) => json.encode(data.toJson());

class Getaddressmodel {
  Getaddressmodel({
    required this.status,
    required this.detail,
  });

  String status;
  Detail detail;

  factory Getaddressmodel.fromJson(Map<String, dynamic> json) => Getaddressmodel(
    status: json["status"],
    detail: Detail.fromJson(json["detail"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "detail": detail.toJson(),
  };
}

class Detail {
  Detail({
    required this.address,
  });

  String address;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
  };
}
