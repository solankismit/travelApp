// To parse this JSON data, do
//
//     final getvehicles = getvehiclesFromJson(jsonString);

import 'dart:convert';

Getvehicles getvehiclesFromJson(String str) => Getvehicles.fromJson(json.decode(str));

String getvehiclesToJson(Getvehicles data) => json.encode(data.toJson());

class Getvehicles {
  String? status;
  List<Detail>? detail;

  Getvehicles({this.status, this.detail});

  Getvehicles.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  String? uservehicleid;
  String? vehicleno;
  String? typename;
  String? maxseats;

  Detail({this.uservehicleid, this.vehicleno, this.typename, this.maxseats});

  Detail.fromJson(Map<String, dynamic> json) {
    uservehicleid = json['uservehicleid'];
    vehicleno = json['vehicleno'];
    typename = json['typename'];
    maxseats = json['maxseats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uservehicleid'] = this.uservehicleid;
    data['vehicleno'] = this.vehicleno;
    data['typename'] = this.typename;
    data['maxseats'] = this.maxseats;
    return data;
  }
}
