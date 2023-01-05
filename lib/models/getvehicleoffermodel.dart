// To parse this JSON data, do
//
//     final getvehicleoffermodel = getvehicleoffermodelFromJson(jsonString);

import 'dart:convert';

Getvehicleoffermodel getvehicleoffermodelFromJson(String str) => Getvehicleoffermodel.fromJson(json.decode(str));

String getvehicleoffermodelToJson(Getvehicleoffermodel data) => json.encode(data.toJson());

class Getvehicleoffermodel {
  Getvehicleoffermodel({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Getvehicleoffermodel.fromJson(Map<String, dynamic> json) => Getvehicleoffermodel(
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
    required this.uservehicleid,
    required this.vehicleno,
    required this.typename,
    required this.maxseats,
  });

  String uservehicleid;
  String vehicleno;
  String typename;
  String maxseats;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    uservehicleid: json["uservehicleid"],
    vehicleno: json["vehicleno"],
    typename: json["typename"],
    maxseats: json["maxseats"],
  );

  Map<String, dynamic> toJson() => {
    "uservehicleid": uservehicleid,
    "vehicleno": vehicleno,
    "typename": typename,
    "maxseats": maxseats,
  };
}
