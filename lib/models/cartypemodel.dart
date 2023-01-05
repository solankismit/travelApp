// To parse this JSON data, do
//
//     final cartypemodel = cartypemodelFromJson(jsonString);

import 'dart:convert';

Cartypemodel cartypemodelFromJson(String str) => Cartypemodel.fromJson(json.decode(str));

String cartypemodelToJson(Cartypemodel data) => json.encode(data.toJson());

class Cartypemodel {
  Cartypemodel({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Cartypemodel.fromJson(Map<String, dynamic> json) => Cartypemodel(
    status: json["status"],
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.id,
    required this.typename,
    required this.type,
    required this.maxseats,
    required this.createdAt,
    required this.updatedAt,
    required this.weight,
    required this.payloadweight,
    required this.fareperkm,
    required this.status,
  });

  String id;
  String typename;
  String type;
  String maxseats;
  DateTime createdAt;
  DateTime updatedAt;
  String weight;
  String payloadweight;
  String fareperkm;
  String status;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    typename: json["typename"],
    type: json["type"],
    maxseats: json["maxseats"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"],
    payloadweight: json["payloadweight"],
    fareperkm: json["fareperkm"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "typename": typename,
    "type": type,
    "maxseats": maxseats,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "weight": weight,
    "payloadweight": payloadweight,
    "fareperkm": fareperkm,
    "status": status,
  };
}
