// To parse this JSON data, do
//
//     final getnotification1 = getnotification1FromJson(jsonString);

import 'dart:convert';

Getnotification1 getnotification1FromJson(String str) => Getnotification1.fromJson(json.decode(str));

String getnotification1ToJson(Getnotification1 data) => json.encode(data.toJson());

class Getnotification1 {
  Getnotification1({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory Getnotification1.fromJson(Map<String, dynamic> json) => Getnotification1(
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
    required this.userid,
    required this.title,
    required this.notification,
    required this.type,
    required this.bookingrequestid,
    required this.mobile,
    required this.createdAt,
    required this.dBiddingRate,
    required this.vPickupLocation,
    required this.vDropLocation,
    required this.vehicleno,
    required this.vehicleType,
    required this.iSendParcelId,
    required this.sendParcelFromCity,
    required this.sendParcelToCity,
  });

  String id;
  String userid;
  String title;
  String notification;
  String type;
  String bookingrequestid;
  String mobile;
  DateTime createdAt;
  String dBiddingRate;
  String vPickupLocation;
  String vDropLocation;
  String vehicleno;
  String vehicleType;
  String iSendParcelId;
  String sendParcelFromCity;
  String sendParcelToCity;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userid: json["userid"],
    title: json["title"],
    notification: json["notification"],
    type: json["type"],
    bookingrequestid: json["bookingrequestid"],
    mobile: json["mobile"],
    createdAt: DateTime.parse(json["created_at"]),
    dBiddingRate: json["dBiddingRate"],
    vPickupLocation: json["vPickupLocation"],
    vDropLocation: json["vDropLocation"],
    vehicleno: json["vehicleno"],
    vehicleType: json["vehicle_type"],
    iSendParcelId: json["iSendParcelID"],
    sendParcelFromCity: json["send_parcel_from_city"],
    sendParcelToCity: json["send_parcel_to_city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "title": title,
    "notification": notification,
    "type": type,
    "bookingrequestid": bookingrequestid,
    "mobile": mobile,
    "created_at": createdAt.toIso8601String(),
    "dBiddingRate": dBiddingRate,
    "vPickupLocation": vPickupLocation,
    "vDropLocation": vDropLocation,
    "vehicleno": vehicleno,
    "vehicle_type": vehicleType,
    "iSendParcelID": iSendParcelId,
    "send_parcel_from_city": sendParcelFromCity,
    "send_parcel_to_city": sendParcelToCity,
  };
}
