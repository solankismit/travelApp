// To parse this JSON data, do
//
//     final hirevehiclesearchridemodel = hirevehiclesearchridemodelFromJson(jsonString);

import 'dart:convert';

Hirevehiclesearchridemodel hirevehiclesearchridemodelFromJson(String str) => Hirevehiclesearchridemodel.fromJson(json.decode(str));

String hirevehiclesearchridemodelToJson(Hirevehiclesearchridemodel data) => json.encode(data.toJson());

class Hirevehiclesearchridemodel {
  Hirevehiclesearchridemodel({
    required this.status,
    required this.rideList,
  });

  String status;
  List<RideList> rideList;

  factory Hirevehiclesearchridemodel.fromJson(Map<String, dynamic> json) => Hirevehiclesearchridemodel(
    status: json["status"],
    rideList: List<RideList>.from(json["ride_list"].map((x) => RideList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "ride_list": List<dynamic>.from(rideList.map((x) => x.toJson())),
  };
}

class RideList {
  RideList({
    required this.uservehicleid,
    required this.vehicleno,
    required this.vehiclemodel,
    required this.ac,
    required this.isCommercial,
    required this.ePlaceType,
    required this.vCity1,
    required this.vCity2,
    required this.vCity3,
    required this.typename,
    required this.maxseats,
    this.drivername,
    this.mobile,
    this.userimage,
  });

  String uservehicleid;
  String vehicleno;
  String vehiclemodel;
  String ac;
  String isCommercial;
  String ePlaceType;
  String vCity1;
  String vCity2;
  String vCity3;
  String typename;
  String maxseats;
  dynamic drivername;
  dynamic mobile;
  dynamic userimage;

  factory RideList.fromJson(Map<String, dynamic> json) => RideList(
    uservehicleid: json["uservehicleid"],
    vehicleno: json["vehicleno"],
    vehiclemodel: json["vehiclemodel"],
    ac: json["ac"],
    isCommercial: json["isCommercial"],
    ePlaceType: json["ePlaceType"],
    vCity1: json["vCity_1"],
    vCity2: json["vCity_2"],
    vCity3: json["vCity_3"],
    typename: json["typename"],
    maxseats: json["maxseats"],
    drivername: json["drivername"],
    mobile: json["mobile"],
    userimage: json["userimage"],
  );

  Map<String, dynamic> toJson() => {
    "uservehicleid": uservehicleid,
    "vehicleno": vehicleno,
    "vehiclemodel": vehiclemodel,
    "ac": ac,
    "isCommercial": isCommercial,
    "ePlaceType": ePlaceType,
    "vCity_1": vCity1,
    "vCity_2": vCity2,
    "vCity_3": vCity3,
    "typename": typename,
    "maxseats": maxseats,
    "drivername": drivername,
    "mobile": mobile,
    "userimage": userimage,
  };
}
