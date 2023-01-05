// To parse this JSON data, do
//
//     final allhirevehicles = allhirevehiclesFromJson(jsonString);

import 'dart:convert';

Allhirevehicles allhirevehiclesFromJson(String str) => Allhirevehicles.fromJson(json.decode(str));

String allhirevehiclesToJson(Allhirevehicles data) => json.encode(data.toJson());

class Allhirevehicles {
  Allhirevehicles({
    required this.data,
    required this.status,
    required this.msg,
  });

  List<Datum> data;
  String status;
  String msg;

  factory Allhirevehicles.fromJson(Map<String, dynamic> json) => Allhirevehicles(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class Datum {
  Datum({
    required this.driverName,
    required this.driverMobile,
    required this.driverProfileImage,
    required this.driverVehicleNo,
    required this.vehiclemodel,
    required this.vehicleType,
    required this.isCommercial,
    required this.ePlaceType,
    required this.vCity1,
    required this.vCity2,
    required this.vCity3,
  });

  String driverName;
  String driverMobile;
  String driverProfileImage;
  String driverVehicleNo;
  String vehiclemodel;
  String vehicleType;
  String isCommercial;
  String ePlaceType;
  String vCity1;
  String vCity2;
  String vCity3;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    driverName: json["driver_name"],
    driverMobile: json["driver_mobile"],
    driverProfileImage: json["driver_profile_image"],
    driverVehicleNo: json["driver_vehicle_no"],
    vehiclemodel: json["vehiclemodel"],
    vehicleType: json["vehicle_type"],
    isCommercial: json["isCommercial"],
    ePlaceType: json["ePlaceType"],
    vCity1: json["vCity_1"],
    vCity2: json["vCity_2"],
    vCity3: json["vCity_3"],
  );

  Map<String, dynamic> toJson() => {
    "driver_name": driverName,
    "driver_mobile": driverMobile,
    "driver_profile_image": driverProfileImage,
    "driver_vehicle_no": driverVehicleNo,
    "vehiclemodel": vehiclemodel,
    "vehicle_type": vehicleType,
    "isCommercial": isCommercial,
    "ePlaceType": ePlaceType,
    "vCity_1": vCity1,
    "vCity_2": vCity2,
    "vCity_3": vCity3,
  };
}
