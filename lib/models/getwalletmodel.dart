// To parse this JSON data, do
//
//     final getwalletmodel = getwalletmodelFromJson(jsonString);

import 'dart:convert';

Getwalletmodel getwalletmodelFromJson(String str) => Getwalletmodel.fromJson(json.decode(str));

String getwalletmodelToJson(Getwalletmodel data) => json.encode(data.toJson());

class Getwalletmodel {
  Getwalletmodel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory Getwalletmodel.fromJson(Map<String, dynamic> json) => Getwalletmodel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.wallet,
    required this.id,
  });

  String wallet;
  String id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallet: json["wallet"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet,
    "id": id,
  };
}
