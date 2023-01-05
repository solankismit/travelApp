// To parse this JSON data, do
//
//     final getdocmodel = getdocmodelFromJson(jsonString);

import 'dart:convert';

Getdocmodel getdocmodelFromJson(String str) => Getdocmodel.fromJson(json.decode(str));

String getdocmodelToJson(Getdocmodel data) => json.encode(data.toJson());

class Getdocmodel {
  Getdocmodel({
    required this.status,
    required this.path,
    required this.documentno,
  });

  String status;
  String path;
  String documentno;

  factory Getdocmodel.fromJson(Map<String, dynamic> json) => Getdocmodel(
    status: json["status"],
    path: json["path"],
    documentno: json["documentno"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": path,
    "documentno": documentno,
  };
}
