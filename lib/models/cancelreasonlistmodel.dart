// To parse this JSON data, do
//
//     final cancelreasonlistmodel = cancelreasonlistmodelFromJson(jsonString);

import 'dart:convert';

Cancelreasonlistmodel cancelreasonlistmodelFromJson(String str) => Cancelreasonlistmodel.fromJson(json.decode(str));

String cancelreasonlistmodelToJson(Cancelreasonlistmodel data) => json.encode(data.toJson());

class Cancelreasonlistmodel {
  Cancelreasonlistmodel({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory Cancelreasonlistmodel.fromJson(Map<String, dynamic> json) => Cancelreasonlistmodel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.text,
  });

  String id;
  String text;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };
}
